import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

/// A widget that displays a loading indicator.
///
/// The `LoadingIndicator` widget is a `StatelessWidget` that shows a centered
/// circular progress indicator. It is commonly used to indicate loading states
/// or background processes.
///
/// This widget uses a `CircularProgressIndicator` with a color defined by
/// `AppColors.primary` to provide visual feedback to the user that a task
/// is in progress.
///
/// Example usage:
/// ```dart
/// LoadingIndicator(),
/// ```
///
/// See also:
/// - `CircularProgressIndicator` for the default circular progress indicator widget.
/// - `AppColors` for color definitions used in this widget.
class LoadingIndicator extends StatelessWidget {
  /// Creates an instance of `LoadingIndicator`.
  ///
  /// The [key] parameter is optional and can be used to uniquely identify
  /// the widget in the widget tree.
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
      ),
    );
  }
}
