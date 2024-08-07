import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/local_models/media.dart';
import '../../../../core/shared/custom_slider.dart';
import '../../../../core/shared/error_screen.dart';
import '../../../../core/shared/loading_indicator.dart';
import '../../../../core/shared/section_header.dart';
import '../../../../core/shared/section_listview.dart';
import '../../../../core/shared/section_listview_card.dart';
import '../../../../core/shared/slider_card.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/resources/app_strings.dart';
import '../../../../core/resources/app_values.dart';
import '../../../../core/injector/injector.dart';
import '../../../../core/utils/enums.dart';
import '../blocs/movies_bloc/movies_bloc.dart';
import '../blocs/movies_bloc/movies_event.dart';
import '../blocs/movies_bloc/movies_state.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()..add(GetMoviesEvent()),
      child: Scaffold(
        body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const LoadingIndicator();
              case RequestStatus.loaded:
                return MoviesWidget(
                  nowPlayingMovies: state.movies[0].take(6).toList(),
                  popularMovies: state.movies[1],
                  topRatedMovies: state.movies[2],
                );
              case RequestStatus.error:
                return ErrorScreen(
                  onTryAgainPressed: () {
                    context.read<MoviesBloc>().add(GetMoviesEvent());
                  },
                );
            }
          },
        ),
      ),
    );
  }
}

class MoviesWidget extends StatelessWidget {
  final List<Media> nowPlayingMovies;
  final List<Media> popularMovies;
  final List<Media> topRatedMovies;

  const MoviesWidget({
    super.key,
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              CustomSlider(
                itemBuilder: (context, itemIndex, _) {
                  return SliderCard(
                    media: nowPlayingMovies[itemIndex],
                    itemIndex: itemIndex,
                  );
                },
              ),
              SectionHeader(
                title: AppStrings.nowPlayingMovies,
                onSeeAllTap: () {
                  context.goNamed(AppRoutes.popularMoviesRoute);
                },
              ),
              SectionListView(
                height: AppSize.s240,
                itemCount: nowPlayingMovies.length,
                itemBuilder: (context, index) {
                  return SectionListViewCard(media: nowPlayingMovies[index]);
                },
              ),
              SectionHeader(
                title: AppStrings.popularMovies,
                onSeeAllTap: () {
                  context.goNamed(AppRoutes.popularMoviesRoute);
                },
              ),
              SectionListView(
                height: AppSize.s240,
                itemCount: popularMovies.length,
                itemBuilder: (context, index) {
                  return SectionListViewCard(media: popularMovies[index]);
                },
              ),
              SectionHeader(
                title: AppStrings.topRatedMovies,
                onSeeAllTap: () {
                  context.goNamed(AppRoutes.topRatedMoviesRoute);
                },
              ),
              SectionListView(
                height: AppSize.s240,
                itemCount: topRatedMovies.length,
                itemBuilder: (context, index) {
                  return SectionListViewCard(media: topRatedMovies[index]);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
