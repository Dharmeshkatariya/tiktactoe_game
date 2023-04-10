import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktoe_game/routes/name_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


 @override
  void initState() {
    // TODO: implement initState
   splash();
    super.initState();
  }
 splash() {
   Timer.periodic(const Duration(seconds: 5), (timer) {
     Get.offNamed(NameRoute.tikToeScreen);
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Image.asset("assets/icon/splash.png"),
            const    SizedBox(height: 20,),
           const  Text("TikTacToe",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
