import 'package:flutter/material.dart';

import '../resources/app_strings.dart';

/// A widget that displays a centered error message.
///
/// The `ErrorText` widget is a `StatelessWidget` that displays an error message
/// to the user. It uses the text styles defined in the application's theme to
/// ensure consistency with the overall design. The widget consists of three lines
/// of text: an "oops" message, a general error message, and a suggestion to try again later.
///
/// This widget does not accept any parameters and is intended to be used as a child
/// widget in a UI layout where an error needs to be communicated to the user.
///
/// The widget is built using the following text styles:
/// - `titleMedium` for the main "oops" message.
/// - `bodyLarge` for the error message and the suggestion to try again later.
///
/// Example usage:
/// ```dart
/// ErrorText()
/// ```
///
/// See also:
/// - `Theme.of(context).textTheme` for accessing the application's text styles.
/// - `AppStrings` for the error message strings used in this widget.
class ErrorText extends StatelessWidget {
  /// Creates an instance of `ErrorText`.
  ///
  /// This constructor is used to create an `ErrorText` widget. No parameters are
  /// required for this widget.
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    // Accesses the text theme from the current application theme.
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.oops,
          style: textTheme.titleMedium,
        ),
        Text(
          AppStrings.errorMessage,
          style: textTheme.bodyLarge,
        ),
        Text(
          AppStrings.tryAgainLater,
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }
}
