import 'package:egybest/core/global/theme/app_color/app_color_light.dart';
import 'package:flutter/material.dart';

ThemeData themeDataLight =
  ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorLight.appBarColor,
      elevation: .9,
      scrolledUnderElevation: 50.0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColorLight.textColor,
      ),
    ),
    scaffoldBackgroundColor: AppColorLight.scaffoldBackgroundColor,
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
    //     .copyWith(background: const Color(0xff301934)),
  );
