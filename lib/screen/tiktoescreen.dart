import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktoe_game/common.dart';
import 'package:tiktoe_game/controller/tiktoe_controller.dart';

class TikToeScreen extends StatelessWidget {
  TikToeScreen({Key? key}) : super(key: key);
  final controller = Get.put(TikToeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow[900],
          title: const Text("TicToe"),
        ),
        body: GetBuilder(
            init: TikToeController(),
            builder: (TikToeController controller) {
              return Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 3,
                      children: List.generate(
                        controller.displayElement.length,
                        (index) => _containerData(index),
                      ),
                    ),
                    Common.button(text: "Start",color: Colors.red[300]),
                  ],
                ),
              );
            }));
  }

  Widget _containerData(int index){
    return GestureDetector(
      onTap: () {
        controller.onTaped(index);
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.grey[900],
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 10),
        child: Text(
          controller.displayElement[index],
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white),
        ),
      ),
    );
  }

}
