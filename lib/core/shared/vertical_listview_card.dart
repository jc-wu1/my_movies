import 'package:flutter/material.dart';

import '../local_models/media.dart';
import '../resources/app_colors.dart';
import '../resources/app_values.dart';
import '../utils/functions.dart';
import 'image_with_shimmer.dart';

/// A [StatelessWidget] that displays a vertical card for a media item.
///
/// This widget shows a media item with an image on the left and details (title,
/// release date, rating, and overview) on the right. It responds to user taps
/// by navigating to a detailed view of the media.
///
/// Requires the [media] parameter to provide media details.
///
/// Example usage:
/// ```dart
/// VerticalListViewCard(
///   media: Media(
///     posterUrl: 'https://example.com/image.jpg',
///     title: 'Sample Movie',
///     releaseDate: '2024-01-01',
///     voteAverage: 8.5,
///     overview: 'A brief overview of the movie.',
///   ),
/// )
/// ```
class VerticalListViewCard extends StatelessWidget {
  /// Creates an instance of [VerticalListViewCard].
  ///
  /// Requires the [media] parameter.
  /// Optionally accepts a [key] for identifying the widget.
  const VerticalListViewCard({
    super.key,
    required this.media,
  });

  /// The media item to be displayed in the card.
  ///
  /// Must not be null.
  final Media media;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        navigateToDetailsView(context, media);
      },
      child: Container(
        height: AppSize.s175,
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s8),
                child: ImageWithShimmer(
                  imageUrl: media.posterUrl,
                  width: AppSize.s110,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppPadding.p6),
                    child: Text(
                      media.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleSmall,
                    ),
                  ),
                  Row(
                    children: [
                      if (media.releaseDate.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.only(right: AppPadding.p12),
                          child: Text(
                            media.releaseDate.split(', ')[1],
                            textAlign: TextAlign.center,
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      ],
                      const Icon(
                        Icons.star_rate_rounded,
                        color: AppColors.ratingIconColor,
                        size: AppSize.s18,
                      ),
                      Text(
                        media.voteAverage.toString(),
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: AppPadding.p14),
                    child: Text(
                      media.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
