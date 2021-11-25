import 'package:flutter/material.dart';
import 'package:tapped_test_project/common/constants/app_font_families.dart';

class AppTheme {
  AppTheme._();

  static ThemeData primaryTheme(BuildContext context) => ThemeData(
        fontFamily: AppFontFamilies.outfit,
      );
}
