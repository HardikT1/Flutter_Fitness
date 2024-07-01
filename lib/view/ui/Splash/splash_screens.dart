import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  SplashScreensState createState() => SplashScreensState();
}

class SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
