import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_values.dart';
import 'error_text.dart';

/// A stateless widget that displays an error screen with an optional retry button.
///
/// This widget shows an error message and, if an [onTryAgainPressed] callback
/// is provided, a button to attempt an action again.
class ErrorScreen extends StatelessWidget {
  /// Creates an instance of [ErrorScreen].
  ///
  /// The [onTryAgainPressed] parameter is optional and specifies the callback
  /// to be invoked when the retry button is pressed.
  const ErrorScreen({
    super.key,
    this.onTryAgainPressed,
  });

  /// A callback function that is triggered when the retry button is pressed.
  ///
  /// This parameter is optional. If provided, the retry button will be displayed
  /// and will invoke this function when pressed.
  final Function()? onTryAgainPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ErrorText(),
          const SizedBox(height: AppSize.s15),
          if (onTryAgainPressed != null)
            ElevatedButton(
              onPressed: onTryAgainPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s30),
                ),
              ),
              child: Text(
                AppStrings.tryAgain,
                style: textTheme.bodyMedium,
              ),
            ),
        ],
      ),
    );
  }
}
