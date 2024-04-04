import 'package:animated_widgets/widgets/opacity_animated.dart';
import 'package:egybest/tv_module/presentation/screens/tv_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../all_module/presntaion/screens/all_screen.dart';
import '../../../home_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashView';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff301934),
      body: Center(
        child: OpacityAnimatedWidget.tween(
          opacityEnabled: 1,
          opacityDisabled: 0,
          duration: const Duration(milliseconds: 2000),
          enabled: true,
          curve: Curves.linear,
          animationFinished: (finished) async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  AllScreen()),
            );
          },
          child: SvgPicture.asset("assets/goouttothemovies.svg"),
        ),
      ),
    );
  }
}
