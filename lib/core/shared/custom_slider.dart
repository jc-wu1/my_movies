import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../resources/app_constants.dart';

/// A custom slider widget that uses [CarouselSlider] to display items.
///
/// This widget creates a carousel slider with a specified item builder and
/// options. The height of the slider is set to 55% of the screen height, and
/// it auto-plays through the items.
class CustomSlider extends StatelessWidget {
  /// A function that builds the items for the carousel slider.
  ///
  /// The [itemBuilder] function takes a [BuildContext], an item index, and an
  /// integer as parameters, and returns a [Widget] to display at the given index.
  final Widget Function(BuildContext context, int itemIndex, int) itemBuilder;

  /// Creates an instance of [CustomSlider].
  ///
  /// The [itemBuilder] parameter is required to define how each item in the
  /// slider should be built.
  const CustomSlider({
    required this.itemBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider.builder(
      itemCount: AppConstants.carouselSliderItemsCount,
      options: CarouselOptions(
        viewportFraction: 1,
        height: size.height * 0.55,
        autoPlay: true,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
