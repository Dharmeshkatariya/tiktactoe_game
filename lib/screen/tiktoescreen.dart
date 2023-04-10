import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktoe_game/common.dart';
import 'package:tiktoe_game/controller/tiktoe_controller.dart';

class TikToeScreen extends GetView<TikToeController> {
  TikToeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.cyan[900],
          title: const Text("TicToe"),
          actions: [
            IconButton(
              onPressed: () {
                controller.refreshPlayerScore();
              },
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
        body: Container(
          color: Colors.blue[900],
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                controller.playerOne.value ? "Turn of O" : "Turn of X",
                style: const TextStyle(
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
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
              controller.isWinner.value
                  ? Common.button(
                      text: "Restart",
                      color: controller.isWinner.value
                          ? Colors.red[300]
                          : Colors.cyan[300],
                      onTap: () {
                        controller.initList();
                        controller.isWinner.value = false;
                      })
                  : Common.button(
                      text: "Start",
                      color: controller.isWinner.value
                          ? Colors.red[300]
                          : Colors.cyan[300],
                      onTap: () {
                        controller.initList();
                      }),
              _playerButtonRow(),
            ],
          ),
        )));
  }

  Widget _playerButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _playerRow(
            color: controller.playerOScore.toString().isEmpty
                ? Colors.white
                : Colors.pink[100],
            text: "Player 1",
            playerscore:
                "${controller.refreshScore.value ? controller.scoreO.value : controller.playerOScore}"),
        _playerRow(
            color: controller.playerXScore.toString().isEmpty
                ? Colors.white
                : Colors.orange[100],
            text: "Player 2",
            playerscore:
                "${controller.refreshScore.value ? controller.scoreX.value : controller.playerXScore}"),
      ],
    );
  }

  Widget _playerRow(
      {required String text, required String playerscore, Color? color}) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(playerscore),
        ],
      ),
    );
  }

  Widget _containerData(int index) {
    return GestureDetector(
      onTap: () {
        controller.onTaped(index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          controller.displayElement[index],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: controller.playerOne.value ? Colors.cyan : Colors.orange),
        ),
      ),
    );
  }
}
