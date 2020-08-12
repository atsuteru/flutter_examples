import 'package:flutter/material.dart';

import 'view/app_splash_page.dart';
import 'view/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Flare Splash-screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        '/': (_) => AppSplashPage(),
        '/home': (_) => MyHomePage(title: 'Flutter Demo'),
      },
    );
  }
}