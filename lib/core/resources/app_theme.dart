import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Provides the theme configuration for the application.
///
/// This method returns a [ThemeData] object that defines the overall look and
/// feel of the app's user interface. The theme includes configurations for
/// various UI components such as the app bar, bottom navigation bar, and text
/// styles. The theme is tailored to use specific colors and text styles
/// defined in the [AppColors] class.
///
/// The returned [ThemeData] object includes the following theme customizations:
///
/// - [scaffoldBackgroundColor]: Sets the background color of the app's main
///   scaffold to [AppColors.primaryBackground].
/// - [bottomNavigationBarTheme]: Configures the appearance of the bottom
///   navigation bar, including its background color, selected and unselected
///   item colors, and the type of navigation bar.
/// - [appBarTheme]: Customizes the appearance of the app bar, including its
///   background color, elevation, title alignment, and title text style.
/// - [textTheme]: Defines text styles for various text elements in the app,
///   such as titles and body text.
///
/// Returns:
/// A [ThemeData] object with the theme configuration for the application.
ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    scaffoldBackgroundColor: AppColors.primaryBackground,

    // Bottom nav bar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.secondaryBackground,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.primaryText,
      type: BottomNavigationBarType.fixed,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryBackground,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: _getTextStyle(
        fontSize: 18,
        color: AppColors.secondaryText,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      titleMedium: _getTextStyle(
        fontSize: 20,
        color: AppColors.secondaryText,
      ),
      titleSmall: _getTextStyle(
        fontSize: 18,
        color: AppColors.secondaryText,
      ),
      bodyLarge: _getTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryText,
      ),
      bodyMedium: _getTextStyle(
        fontSize: 14,
        color: AppColors.secondaryText,
      ),
      bodySmall: _getTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryText,
      ),
    ),
  );
}

/// Creates a [TextStyle] object using the Poppins font from Google Fonts.
///
/// This helper function simplifies the creation of text styles with consistent
/// font properties across the application. It uses the Poppins font with the
/// specified font size, font weight, and color.
///
/// Parameters:
/// - [fontSize]: The size of the font. Must be provided.
/// - [fontWeight]: The weight of the font (optional). Defaults to [FontWeight.w600].
/// - [color]: The color of the text. Must be provided.
///
/// Returns:
/// A [TextStyle] object with the specified font properties.
TextStyle _getTextStyle({
  required double fontSize,
  FontWeight fontWeight = FontWeight.w600,
  required Color color,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
