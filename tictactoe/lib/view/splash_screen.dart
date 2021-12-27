import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/view/home_screen.dart';
import 'package:tictactoe/constant/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: AppColor.appColor));
    startTimer(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.30,
                height: MediaQuery.of(context).size.height * 0.30,
                child: Image.asset('asset/tictactoe.png')
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).size.height * 0.10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Design & Developed by : Traversal',
                      style: TextStyle(color: Color.fromARGB(255, 167, 166, 166),fontSize: 10)
                    )
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }

  void startTimer(BuildContext context){
    Timer(const Duration(seconds: 2),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen())));
  }
}
