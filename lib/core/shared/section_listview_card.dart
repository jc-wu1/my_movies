import 'package:flutter/material.dart';

import '../local_models/media.dart';
import '../resources/app_colors.dart';
import '../resources/app_values.dart';
import '../utils/functions.dart';
import 'image_with_shimmer.dart';

/// A [StatelessWidget] that displays a card for a media item.
///
/// This widget shows an image of the media, its title, and its average rating.
/// The image is tappable and navigates to a detailed view when pressed.
///
/// Requires the [media] parameter to provide information about the media item.
///
/// Example usage:
/// ```dart
/// SectionListViewCard(
///   media: Media(
///     posterUrl: 'https://example.com/image.jpg',
///     title: 'Sample Media',
///     voteAverage: 8.5,
///   ),
/// )
/// ```
class SectionListViewCard extends StatelessWidget {
  /// The media item to be displayed in the card.
  ///
  /// Must not be null.
  final Media media;

  /// Creates an instance of [SectionListViewCard].
  ///
  /// Requires the [media] parameter to be non-null.
  /// Optionally accepts a [key] for identifying the widget.
  const SectionListViewCard({
    required this.media,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: AppSize.s120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              navigateToDetailsView(context, media);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s8),
              child: ImageWithShimmer(
                imageUrl: media.posterUrl,
                width: double.infinity,
                height: AppSize.s175,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                media.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.ratingIconColor,
                    size: AppSize.s18,
                  ),
                  Text(
                    '${media.voteAverage}/10',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
