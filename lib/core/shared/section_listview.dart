import 'package:flutter/material.dart';

import '../resources/app_values.dart';

/// A [StatelessWidget] that displays a horizontally scrolling list of items.
///
/// This widget provides a list view with a specified height, item count, and item builder.
/// The list items are separated by a fixed-width space.
///
/// Requires [height], [itemCount], and [itemBuilder] parameters.
///
/// Example usage:
/// ```dart
/// SectionListView(
///   height: 200.0,
///   itemCount: 10,
///   itemBuilder: (context, index) {
///     return SectionListViewCard(
///       media: Media(
///         posterUrl: 'https://example.com/image.jpg',
///         title: 'Sample Media',
///         voteAverage: 8.5,
///       ),
///     );
///   },
/// )
/// ```
class SectionListView extends StatelessWidget {
  /// The number of items in the list.
  ///
  /// Determines how many items the list view will contain.
  final int itemCount;

  /// The height of the list view.
  ///
  /// Determines how tall the list view will be.
  final double height;

  /// A function that creates a widget for each item in the list.
  ///
  /// The [itemBuilder] function takes the [BuildContext] and the item's index
  /// as parameters and returns a widget to be displayed at that index.
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// Creates an instance of [SectionListView].
  ///
  /// Requires [height], [itemCount], and [itemBuilder] parameters.
  /// Optionally accepts a [key] for identifying the widget.
  const SectionListView({
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder,
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppSize.s10),
      ),
    );
  }
}
