import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import 'image_with_shimmer.dart';

/// A [StatelessWidget] that displays an image with a gradient shader mask.
///
/// This widget shows an image with a gradient effect applied to it.
/// The gradient fades from black to transparent, creating a visual effect
/// for slider or carousel components.
///
/// Requires the [imageUrl] parameter to provide the image source.
///
/// Example usage:
/// ```dart
/// SliderCardImage(
///   imageUrl: 'https://example.com/image.jpg',
/// )
/// ```
class SliderCardImage extends StatelessWidget {
  /// Creates an instance of [SliderCardImage].
  ///
  /// Requires the [imageUrl] parameter to be non-null.
  /// Optionally accepts a [key] for identifying the widget.
  const SliderCardImage({
    super.key,
    required this.imageUrl,
  });

  /// The URL of the image to be displayed.
  ///
  /// Must not be null.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.black,
            AppColors.black,
            AppColors.transparent,
          ],
          stops: [0.3, 0.5, 1],
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        );
      },
      child: ImageWithShimmer(
        height: size.height * 0.6,
        width: double.infinity,
        imageUrl: imageUrl,
      ),
    );
  }
}
