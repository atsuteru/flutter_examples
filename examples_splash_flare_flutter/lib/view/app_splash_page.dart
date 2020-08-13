import 'dart:math';

import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

class AppSplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppSplashPageState();
}

class _AppSplashPageState extends State<AppSplashPage>{

  @override
  Widget build(BuildContext context) {
    var resultNumber = Random().nextInt(6) + 1;
    return WillPopScope(
        onWillPop: () async => false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blueAccent,
          child: FlareActor(
          'assets/app_splash_roulette.flr',
          alignment: Alignment.center,
          fit: BoxFit.contain,
          controller: _AppSplashController(
            number: resultNumber,
            callback: (name) {
              Future.delayed(Duration(milliseconds: 500)).then((value) {
                Navigator.of(context).pushReplacementNamed("/home");
              });
            },
          ),
        )
      )
    );
  }
}

class _AppSplashController extends FlareControls {

  final int number;
  final FlareCompletedCallback callback;
  _AppSplashController({
    @required this.number,
    this.callback
  });

  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    play('shuffle');
  }

  @override
  void onCompleted(String name) {
    if (name == 'shuffle') {
      play('result_$number');
      return;
    }
    callback?.call(name);
  }
}