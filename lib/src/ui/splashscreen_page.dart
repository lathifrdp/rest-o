import 'package:flutter/material.dart';
import 'package:restoran_dicoding/src/helper/theme_colors.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/restaurant', (route) => false);
    });

    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
          child: Text(
        "Rest-O",
        style: TextStyle(
            color: warningColor60, fontSize: 18, fontStyle: FontStyle.italic),
      )),
    );
  }
}
