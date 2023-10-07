import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import '../../core/utils/utils.dart';

final class AppTheme {
  AppTheme._();
  static TextTheme darkTextTheme = const TextTheme();

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      // fontFamily: AppConstants.appFontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        titleTextStyle: AppTextStyles.small14.copyWith(
          color: AppColors.textColor1,
          fontWeight: FontWeight.w400,
          // fontFamily: AppConstants.appFontFamily,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
    );
  }
}
