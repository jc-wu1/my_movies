import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/local_models/media.dart';
import '../../../../core/local_models/media_details.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_strings.dart';
import '../../../../core/shared/details_card.dart';
import '../../../../core/shared/error_screen.dart';
import '../../../../core/shared/loading_indicator.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/injector/injector.dart';
import '../../../../core/shared/overview_section.dart';
import '../../../../core/shared/section_listview.dart';
import '../../../../core/shared/section_listview_card.dart';
import '../../../../core/shared/section_title.dart';
import '../../../../core/utils/enums.dart';
import '../../../authentication/bloc/authentication_cubit.dart';
import '../../../favorites/presentation/blocs/favorites_bloc/favorites_bloc.dart';
import '../../../watchlist/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';
import '../components/movie_card_details.dart';
import '../blocs/movie_details_bloc/movie_details_bloc.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieDetailsBloc(
            sl(),
          )..add(GetMovieDetailsEvent(movieId)),
        ),
      ],
      child: MovieDetailsView(
        movieId: movieId,
      ),
    );
  }
}

class MovieDetailsView extends StatelessWidget {
  final int movieId;

  const MovieDetailsView({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          switch (state.status) {
            case RequestStatus.loading:
              return const LoadingIndicator();
            case RequestStatus.loaded:
              return MovieDetailsWidget(
                movieDetails: state.movieDetails!,
              );
            case RequestStatus.error:
              return ErrorScreen(
                onTryAgainPressed: () {
                  context
                      .read<MovieDetailsBloc>()
                      .add(GetMovieDetailsEvent(movieId));
                },
              );
          }
        },
      ),
    );
  }
}

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({
    super.key,
    required this.movieDetails,
  });

  final MediaDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: BlocProvider.of<WatchlistBloc>(context)
            ..add(
              CheckWatchListAddedEvent(tmdbId: movieDetails.tmdbID),
            ),
        ),
        BlocProvider.value(
          value: BlocProvider.of<FavoritesBloc>(context)
            ..add(
              CheckFavoriteAddedEvent(tmdbId: movieDetails.tmdbID),
            ),
        ),
      ],
      child: MovieDetailsWidgetView(
        movieDetails: movieDetails,
      ),
    );
  }
}

class MovieDetailsWidgetView extends StatefulWidget {
  const MovieDetailsWidgetView({
    required this.movieDetails,
    super.key,
  });

  final MediaDetails movieDetails;

  @override
  State<MovieDetailsWidgetView> createState() => _MovieDetailsWidgetViewState();
}

class _MovieDetailsWidgetViewState extends State<MovieDetailsWidgetView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              DetailsCard(
                mediaDetails: widget.movieDetails,
                detailsWidget:
                    MovieCardDetails(movieDetails: widget.movieDetails),
              ),
              const SectionTitle(title: AppStrings.story),
              OverviewSection(overview: widget.movieDetails.overview),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.download),
                      onPressed: () async {
                        await _onDownloadImageBtnPressed();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primaryBtnText,
                      ),
                      label: const Text('Images'),
                    ),
                    BlocConsumer<FavoritesBloc, FavoritesState>(
                      listener: (context, state) {
                        if (state.status == FavoritesRequestStatus.itemAdded) {
                          widget.movieDetails.id = state.id;
                          widget.movieDetails.isFavorite = true;
                        } else if (state.status ==
                            FavoritesRequestStatus.itemRemoved) {
                          widget.movieDetails.id = null;
                          widget.movieDetails.isFavorite = false;
                        } else if (state.status ==
                                FavoritesRequestStatus.isItemAdded &&
                            state.id != -1) {
                          widget.movieDetails.id = state.id;
                          widget.movieDetails.isFavorite = true;
                        }
                      },
                      builder: (context, state) {
                        return TextButton.icon(
                          icon: const Icon(Icons.favorite),
                          onPressed: () {
                            final authStatus = context
                                .read<AuthenticationCubit>()
                                .state
                                .status;

                            if (authStatus == AuthStatus.authenticated) {
                              widget.movieDetails.isFavorite
                                  ? context.read<FavoritesBloc>().add(
                                        RemoveFavoriteItemEvent(
                                            widget.movieDetails.id!),
                                      )
                                  : context.read<FavoritesBloc>().add(
                                        AddFavoriteItemEvent(
                                          media: Media.fromMediaDetails(
                                            widget.movieDetails
                                              ..isFavorite = true
                                              ..isWatchlist = false,
                                          ),
                                        ),
                                      );
                            } else {
                              Fluttertoast.showToast(
                                msg: "Please login to unlock full features!",
                                toastLength: Toast.LENGTH_LONG,
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: widget.movieDetails.isFavorite
                                ? AppColors.primary
                                : AppColors.secondaryText,
                          ),
                          label: const Text('Like'),
                        );
                      },
                    ),
                    BlocConsumer<WatchlistBloc, WatchlistState>(
                      listener: (context, state) {
                        if (state.status == WatchlistRequestStatus.itemAdded) {
                          widget.movieDetails.id = state.id;
                          widget.movieDetails.isWatchlist = true;
                        } else if (state.status ==
                            WatchlistRequestStatus.itemRemoved) {
                          widget.movieDetails.id = null;
                          widget.movieDetails.isWatchlist = false;
                        } else if (state.status ==
                                WatchlistRequestStatus.isItemAdded &&
                            state.id != -1) {
                          widget.movieDetails.id = state.id;
                          widget.movieDetails.isWatchlist = true;
                        }
                      },
                      builder: (context, state) {
                        return TextButton.icon(
                          icon: const Icon(Icons.bookmark_rounded),
                          onPressed: () {
                            final authStatus = context
                                .read<AuthenticationCubit>()
                                .state
                                .status;
                            if (authStatus == AuthStatus.authenticated) {
                              widget.movieDetails.isWatchlist
                                  ? context.read<WatchlistBloc>().add(
                                        RemoveWatchListItemEvent(
                                          widget.movieDetails.id ?? 0,
                                        ),
                                      )
                                  : context.read<WatchlistBloc>().add(
                                        AddWatchListItemEvent(
                                          media: Media.fromMediaDetails(
                                            widget.movieDetails
                                              ..isWatchlist = true
                                              ..isFavorite = false,
                                          ),
                                        ),
                                      );
                            } else {
                              Fluttertoast.showToast(
                                msg: "Please login to unlock full features!",
                                toastLength: Toast.LENGTH_LONG,
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: widget.movieDetails.isWatchlist
                                ? AppColors.primary
                                : AppColors.secondaryText,
                          ),
                          label: const Text('Watch List'),
                        );
                      },
                    ),
                  ],
                ),
              ),
              if (widget.movieDetails.similar.isNotEmpty) ...[
                const SectionTitle(title: AppStrings.similar),
                SectionListView(
                  height: AppSize.s240,
                  itemCount: widget.movieDetails.similar.length,
                  itemBuilder: (context, index) => SectionListViewCard(
                    media: widget.movieDetails.similar[index],
                  ),
                ),
              ] else ...[
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.oops,
                        style: textTheme.titleMedium,
                      ),
                      Text(
                        AppStrings.noSimilar,
                        style: textTheme.bodyLarge,
                      ),
                      const SizedBox(height: AppSize.s15),
                    ],
                  ),
                )
              ],
              const SizedBox(height: AppSize.s8),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _onDownloadImageBtnPressed() async {
    Fluttertoast.showToast(
      msg: "Downloading an image, please wait...",
      toastLength: Toast.LENGTH_LONG,
    );
    if (Platform.isIOS || Platform.isAndroid) {
      bool status = await Permission.storage.isGranted;

      if (!status) await Permission.storage.request();
    }
    var response = await Dio().get(
      widget.movieDetails.posterUrl,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );
    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      name:
          "poster_${widget.movieDetails.tmdbID}_${Random.secure().nextInt(999999999)}",
    );

    if (result["isSuccess"] == true || result["isSuccess"] == "true") {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
        msg: "Image saved to gallery",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
