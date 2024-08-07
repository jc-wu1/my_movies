import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../resources/app_colors.dart';

/// A widget that displays an image with a shimmer effect while loading.
///
/// The `ImageWithShimmer` widget is a `StatelessWidget` that shows an image from
/// the network with a shimmer placeholder effect during loading and an error icon
/// if the image fails to load. It uses the `CachedNetworkImage` package to handle
/// image caching and network requests, and the `Shimmer` package to display a shimmer
/// effect.
///
/// The shimmer effect is a placeholder that appears while the image is loading.
/// If the image fails to load, an error icon is displayed.
///
/// This widget requires the following parameters:
/// - `imageUrl`: The URL of the image to be displayed.
/// - `width`: The width of the image.
/// - `height`: The height of the image.
///
/// Example usage:
/// ```dart
/// ImageWithShimmer(
///   imageUrl: 'https://example.com/image.jpg',
///   width: 100.0,
///   height: 100.0,
/// )
/// ```
///
/// See also:
/// - `CachedNetworkImage` for caching and network image handling.
/// - `Shimmer` for creating shimmer effects.
/// - `AppColors` for color definitions used in this widget.
class ImageWithShimmer extends StatelessWidget {
  /// Creates an instance of `ImageWithShimmer`.
  ///
  /// The [imageUrl], [width], and [height] parameters are required to specify
  /// the image URL and its dimensions.
  const ImageWithShimmer({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  /// The URL of the image to be displayed.
  final String imageUrl;

  /// The height of the image.
  final double height;

  /// The width of the image.
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: (_, __) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          height: height,
          color: AppColors.secondaryText,
        ),
      ),
      errorWidget: (_, __, ___) => const Icon(
        Icons.error,
        color: AppColors.error,
      ),
    );
  }
}
