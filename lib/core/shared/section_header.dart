import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_values.dart';

/// A header widget with a title and a "See All" action button.
///
/// The `SectionHeader` widget is a `StatelessWidget` that displays a section header
/// with a title and an action button. The action button triggers a callback function
/// when tapped, typically used to navigate to a detailed view or show more items.
///
/// The `title` parameter specifies the text to display as the section title.
/// The `onSeeAllTap` parameter is a callback function that is invoked when the
/// "See All" button is tapped.
///
/// This widget uses padding defined by `AppPadding.p4` and `AppPadding.p16`, and
/// applies text styles from the current theme. The "See All" label is provided
/// by `AppStrings` and is accompanied by an arrow icon.
///
/// Example usage:
/// ```dart
/// SectionHeader(
///   title: 'Popular Movies',
///   onSeeAllTap: () {
///     // Handle "See All" tap event
///   },
/// ),
/// ```
///
/// See also:
/// - `AppPadding` for padding constants used in this widget.
/// - `AppStrings` for the text labels used in this widget.
/// - `AppSize` for sizing constants used in this widget.
class SectionHeader extends StatelessWidget {
  /// The title of the section.
  final String title;

  /// Callback function invoked when the "See All" button is tapped.
  final Function() onSeeAllTap;

  /// Creates an instance of `SectionHeader`.
  ///
  /// The [title] parameter specifies the text to display as the section title.
  /// The [onSeeAllTap] parameter is a callback function that is called when the
  /// "See All" button is tapped.
  const SectionHeader({
    super.key,
    required this.title,
    required this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p4,
        horizontal: AppPadding.p16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.titleSmall,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(
              AppSize.s12,
            ),
            onTap: onSeeAllTap,
            child: Row(
              children: [
                Text(
                  AppStrings.seeAll,
                  style: textTheme.bodyLarge,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: AppSize.s12,
                  color: AppColors.primaryText,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
