import 'package:flutter/material.dart';
import 'package:tapped_test_project/common/constants/app_colors.dart';
import 'package:tapped_test_project/common/constants/app_font_families.dart';

class AppTheme {
  AppTheme._();

  static ThemeData primaryTheme(BuildContext context) => ThemeData(
        fontFamily: AppFontFamilies.outfit,
        primaryColor: AppColors.primaryColor,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.primaryColor),
        primaryColorDark: AppColors.primaryColorDark,
        scaffoldBackgroundColor: AppColors.primaryColor,
        colorScheme: Theme.of(context).colorScheme.copyWith(secondary: Colors.white),
      );
}
