import 'package:get/get.dart';

class TikToeController extends GetxController {
  RxBool playerOne = true.obs;

  int scoreO= 0;
  int scoreX = 0;
  int filledBoxes = 0;
  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];

  onTaped(int index) {
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
        displayElement[0] == "") {
      print(displayElement);
    } else if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] == "") {
    } else if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] == "") {
    }
    //checking column
    else if (displayElement[2] == "" &&
        displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8]) {
      print(displayElement);
    } else if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] == "") {
      print(displayElement);
    } else if (displayElement[1] == "" &&
        displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7]) {
      print(displayElement);
    }
    // side corner check
    else if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] == "") {
      print(displayElement);
    } else if (displayElement[2] == "" &&
        displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6]) {
      print(displayElement);
    }
  }
  checkWinner(String winner ){
    if(winner == "0"){
      scoreO++;
    }else{
      scoreX++;
    }
  }
}
