import 'package:flutter/material.dart';

import '../resources/app_values.dart';

/// A [StatelessWidget] that displays a section title with padding.
///
/// This widget displays a text widget with the given [title], styled according
/// to the theme's [titleSmall] text style. It applies padding around the text.
///
/// Requires the [title] parameter.
///
/// Example usage:
/// ```dart
/// SectionTitle(
///   title: 'Featured Movies',
/// )
/// ```
class SectionTitle extends StatelessWidget {
  /// Creates an instance of [SectionTitle].
  ///
  /// Requires the [title] parameter to be non-null.
  /// Optionally accepts a [key] for identifying the widget.
  const SectionTitle({
    super.key,
    required this.title,
  });

  /// The title text to be displayed.
  ///
  /// Must not be null.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: AppPadding.p16,
        left: AppPadding.p16,
        top: AppPadding.p8,
        bottom: AppPadding.p4,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
