import 'package:get/get.dart';
import 'package:tiktoe_game/common.dart';

class TikToeController extends GetxController {
  RxBool playerOne = true.obs;
  RxBool isWinner = false.obs;
  RxBool notWinner = true.obs;
  int scoreO = 0;
  int scoreX = 0;
  int filledBoxes = 0;

  List<String> displayElement = [];

  @override
  void onInit() {
    // TODO: implement onInit
    initList();
    super.onInit();
  }

  initList() {
    displayElement.clear();
    filledBoxes = 0;
    notWinner.value = true;
    for (int i = 0; i < 9; i++) {
      displayElement.add('');
    }

    update();
  }

  onTaped(int index) {
    isWinner.value = true;
    if (playerOne.value && displayElement[index] == '') {
      displayElement[index] = 'O';
      filledBoxes++;
      playerOne.value = false;
      print("$displayElement");
    } else if (!playerOne.value && displayElement[index] == '') {
      displayElement[index] = 'X';
      filledBoxes++;
      playerOne.value = !playerOne.value;
      print("$displayElement");
    }
    playerWinner();

    update();
  }

  playerWinner() {
    // checking row
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != "") {
      isWinner.value = true;
      Common.commonDialog();
    } else if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != "") {
      isWinner.value = true;
      Common.commonDialog();
    } else if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != "") {
      isWinner.value = true;
      Common.commonDialog();
    }
    //checking column
    else if (displayElement[2] != "" &&
        displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8]) {
      isWinner.value = true;
      Common.commonDialog();
      print(displayElement);
    } else if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != "") {
      isWinner.value = true;
      Common.commonDialog();
      print(displayElement);
    } else if (displayElement[1] != "" &&
        displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7]) {
      isWinner.value = true;
      Common.commonDialog();
      print(displayElement);
    }
    // side corner check
    else if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != "") {
      isWinner.value = true;
      print(displayElement);
    } else if (displayElement[2] != "" &&
        displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6]) {
      isWinner.value = true;
      Common.commonDialog();
    } else if (filledBoxes == 9) {
      notWinner.value = false;
      Common.commonDialog();
      print(displayElement);
    }
  }
}
