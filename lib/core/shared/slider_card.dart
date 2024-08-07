import 'package:flutter/material.dart';

import '../local_models/media.dart';
import '../resources/app_colors.dart';
import '../resources/app_constants.dart';
import '../resources/app_values.dart';
import '../utils/functions.dart';
import 'slider_card_image.dart';

/// A [StatelessWidget] that represents a card in a slider or carousel.
///
/// This widget displays a media item with an image, title, release date, and
/// a carousel indicator. It responds to user taps by navigating to a detailed
/// view of the media.
///
/// Requires the [media] parameter to provide media details and the [itemIndex]
/// parameter to indicate the current position in the carousel.
///
/// Example usage:
/// ```dart
/// SliderCard(
///   media: Media(
///     posterUrl: 'https://example.com/image.jpg',
///     title: 'Sample Movie',
///     releaseDate: '2024-01-01',
///   ),
///   itemIndex: 0,
/// )
/// ```
class SliderCard extends StatelessWidget {
  /// Creates an instance of [SliderCard].
  ///
  /// Requires [media] and [itemIndex] parameters.
  /// Optionally accepts a [key] for identifying the widget.
  const SliderCard({
    super.key,
    required this.media,
    required this.itemIndex,
  });

  /// The media item to be displayed in the card.
  ///
  /// Must not be null.
  final Media media;

  /// The index of the current item in the carousel.
  ///
  /// Used to highlight the current position in the carousel indicator.
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        navigateToDetailsView(context, media);
      },
      child: SafeArea(
        child: Stack(
          children: [
            SliderCardImage(imageUrl: media.posterUrl),
            Padding(
              padding: const EdgeInsets.only(
                right: AppPadding.p16,
                left: AppPadding.p16,
                bottom: AppPadding.p10,
              ),
              child: SizedBox(
                height: size.height * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      media.title,
                      maxLines: 2,
                      style: textTheme.titleMedium,
                    ),
                    Text(
                      media.releaseDate,
                      style: textTheme.bodyLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          AppConstants.carouselSliderItemsCount,
                          (indexDot) {
                            return Container(
                              margin:
                                  const EdgeInsets.only(right: AppMargin.m10),
                              width: indexDot == itemIndex
                                  ? AppSize.s30
                                  : AppSize.s6,
                              height: AppSize.s6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSize.s6),
                                color: indexDot == itemIndex
                                    ? AppColors.primary
                                    : AppColors.inactiveColor,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
