import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller/tiktoe_controller.dart';

class Common {
  static Widget button(
      {required String text, Color? color, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  static commonDialog() {
    final controller = Get.put(TikToeController());
    return Get.dialog(Center(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Container(
              alignment: Alignment.center,
              width: 310,
              height: 210,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller. notWinner.value?  Image.asset(
                    "assets/icon/t.jpg",
                    height: 70,
                  ) : Image.asset(
                    "assets/icon/not.png",
                    height: 70,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  controller. notWinner.value?  Text("Winner") : Text("try again latter"),
                  button(
                      text:controller. notWinner.value? "Restart" : "play again",
                      color: Colors.red,
                      onTap: () {
                        controller.initList();
                        Get.back();

                      }),
                ],
              )),
        ),
      ),
    ));
  }
}
