import 'package:flutter/material.dart';
import 'package:news_project/utils/app_styles.dart';

import 'App_colors.dart';

class AppThem {
  static final ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(color: AppColors.white),
    indicatorColor: AppColors.Black,
    textTheme: TextTheme(
      labelLarge: AppStyles.blackBold16,
      labelMedium: AppStyles.blackMed14,
    ),
  );

  static ThemeData darkMode = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(color: AppColors.Black),
    indicatorColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.Black,
    textTheme: TextTheme(
      labelLarge: AppStyles.whiteBold16,
      labelMedium: AppStyles.whiteMed14,
    ),
  );
}
