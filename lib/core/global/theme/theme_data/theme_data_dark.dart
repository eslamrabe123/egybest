import 'package:flutter/material.dart';

import '../app_color/app_color_dark.dart';

ThemeData themeDataDark =
ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(

    backgroundColor: AppColorsDark.appBarColor,
    elevation: .9,
    scrolledUnderElevation: 50.0,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: AppColorsDark.textColor,
    ),
  ),
  scaffoldBackgroundColor: AppColorsDark.scaffoldBackgroundColor,
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
  //     .copyWith(background: const Color(0xff301934)),
);
