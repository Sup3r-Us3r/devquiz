import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:devquiz/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dev Quiz',
      home: SplashPage(),
      theme: ThemeData(
        accentColor: AppColors.purple,
      ),
    );
  }
}
