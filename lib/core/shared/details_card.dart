import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/favorites/presentation/blocs/favorites_bloc/favorites_bloc.dart';
import '../../features/watchlist/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';
import '../local_models/media_details.dart';
import '../resources/app_colors.dart';
import '../resources/app_values.dart';
import '../utils/functions.dart';
import 'slider_card_image.dart';

/// A stateless widget that displays a details card with media information.
///
/// This widget presents media details, a widget for additional information, and
/// optionally a trailer button if a trailer URL is provided.
class DetailsCard extends StatelessWidget {
  /// Creates an instance of [DetailsCard].
  ///
  /// The [mediaDetails] parameter is required and provides the media information
  /// to be displayed. The [detailsWidget] parameter is required and provides
  /// additional details to be displayed below the title.
  const DetailsCard({
    required this.mediaDetails,
    required this.detailsWidget,
    super.key,
  });

  /// The details of the media to be displayed.
  final MediaDetails mediaDetails;

  /// A widget displaying additional details about the media.
  final Widget detailsWidget;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    // Dispatch events to check if the media is added to watchlist or favorites.
    context
        .read<WatchlistBloc>()
        .add(CheckWatchListAddedEvent(tmdbId: mediaDetails.tmdbID));
    context
        .read<FavoritesBloc>()
        .add(CheckFavoriteAddedEvent(tmdbId: mediaDetails.tmdbID));

    return SafeArea(
      child: Stack(
        children: [
          // Background image of the media.
          SliderCardImage(imageUrl: mediaDetails.posterUrl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: SizedBox(
              height: size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mediaDetails.title,
                            maxLines: 2,
                            style: textTheme.titleMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: AppPadding.p4,
                              bottom: AppPadding.p6,
                            ),
                            child: detailsWidget,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rate_rounded,
                                color: AppColors.ratingIconColor,
                                size: AppSize.s18,
                              ),
                              Text(
                                '${mediaDetails.voteAverage} ',
                                style: textTheme.bodyMedium,
                              ),
                              Text(
                                mediaDetails.voteCount,
                                style: textTheme.bodySmall,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s10,
                          ),
                          // Play trailer button if trailer URL is available.
                          if (mediaDetails.trailerUrl.isNotEmpty) ...[
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: AppColors.primaryBtnText,
                                  backgroundColor: AppColors.primary,
                                ),
                                icon: const Icon(Icons.play_circle),
                                onPressed: () {
                                  launchAnUrl(mediaDetails.trailerUrl);
                                },
                                label: const Text('Play Trailer'),
                              ),
                            )
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p12,
              left: AppPadding.p16,
              right: AppPadding.p16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.iconContainerColor,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.secondaryText,
                      size: AppSize.s20,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
