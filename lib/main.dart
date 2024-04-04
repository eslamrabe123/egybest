import 'package:egybest/all_module/presntaion/controller/all_state.dart';
import 'package:egybest/core/utils/app_string.dart';
import 'package:egybest/movies_module/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import 'core/global/theme/theme_data/theme_data_dark.dart';
import 'core/services/services_locator.dart';

void main() {
  ServiceLocator().init();
  AllState().printAll();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: themeDataDark,
      home: const SplashScreen(),
    );
  }
}























Future<void> getAppName() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String appName = packageInfo.appName;
  print('Application Name: $appName');
}

Future<void> getAppUrl() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String appUrl = packageInfo.packageName;
  print('Application URL: $appUrl');
  print('app url');
}

class GgetAppUrl extends StatelessWidget {
  const GgetAppUrl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await getAppUrl();
            await getAppName();
          },
          child: const Text('click'),
        ),
      ),
    );
  }
}


