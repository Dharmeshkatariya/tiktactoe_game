import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktoe_game/routes/page_routes.dart';
import 'package:tiktoe_game/screen/splash%20screen.dart';
import 'package:tiktoe_game/screen/tiktoescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: PageRoutes.pages,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen()
    );
  }
}
