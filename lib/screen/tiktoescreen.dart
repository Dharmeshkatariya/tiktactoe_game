import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktoe_game/common.dart';
import 'package:tiktoe_game/controller/tiktoe_controller.dart';

class TikToeScreen extends StatelessWidget {
  TikToeScreen({Key? key}) : super(key: key);
  final _controller = Get.put(TikToeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow[900],
          title: const Text("TicToe"),
        ),
        body: GetBuilder(
            init: _controller,
            builder: (TikToeController controller) {
              return Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _playerRow(text: "Player 1"),
                        _playerRow(text: "Player 2"),
                      ],
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
                    _controller.isWinner.value
                        ? Common.button(
                            text: "restart",
                            color: Colors.red[300],
                            onTap: () {
                              _controller.initList();
                              _controller.isWinner.value = false;
                            })
                        : Common.button(
                            text: "Start",
                            color: Colors.red[300],
                            onTap: () {
                              _controller.initList();
                            }),
                    Text(
                      _controller.playerOne.value ? "Turn of O" : "Turn of X",
                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),
                    ),
                  ],
                ),
              );
            }));
  }

  Widget _playerRow({required String text}) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.cyan[100],
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )),
       const  Text("score"),
      ],
    );
  }

  Widget _containerData(int index) {
    return GestureDetector(
      onTap: () {
        _controller.onTaped(index) ;
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.grey[900],
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          _controller.displayElement[index],
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
