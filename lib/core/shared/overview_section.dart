import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../resources/app_strings.dart';
import '../resources/app_values.dart';

/// A widget that displays an expandable overview text section.
///
/// The `OverviewSection` widget is a `StatelessWidget` that presents a section
/// of text with expandable and collapsible functionality. It uses the `ReadMoreText`
/// widget to allow users to read more or less of the text content.
///
/// The `overview` parameter is required and specifies the text to be displayed in the
/// section. The text will be truncated after a certain number of lines, with options
/// to expand or collapse the view.
///
/// This widget uses padding defined by `AppPadding.p16` and applies text styles
/// from the current theme. The "show more" and "show less" labels are provided by
/// `AppStrings`.
///
/// Example usage:
/// ```dart
/// OverviewSection(
///   overview: 'This is a long overview text that might need to be expanded.',
/// ),
/// ```
///
/// See also:
/// - `ReadMoreText` for the expandable text widget.
/// - `AppPadding` for padding constants used in this widget.
/// - `AppStrings` for the text labels used in this widget.
class OverviewSection extends StatelessWidget {
  final String overview;

  /// Creates an instance of `OverviewSection`.
  ///
  /// The [overview] parameter is required and specifies the text to be displayed
  /// in the overview section.
  const OverviewSection({
    super.key,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: ReadMoreText(
        overview,
        trimLines: 5,
        trimMode: TrimMode.Line,
        trimCollapsedText: AppStrings.showMore,
        trimExpandedText: AppStrings.showLess,
        style: Theme.of(context).textTheme.bodyLarge,
        moreStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w600),
        lessStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
