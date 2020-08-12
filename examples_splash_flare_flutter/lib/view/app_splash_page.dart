import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AppSplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppSplashPageState();
}

class _AppSplashPageState extends State<AppSplashPage>{

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blueAccent,
          child: FlareActor(
          'assets/app_splash.flr',
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: 'all',
          callback: (name) {
            Navigator.of(context).pushReplacementNamed("/home");
          },
        )
      )
    );
  }
}