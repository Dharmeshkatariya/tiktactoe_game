import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktoe_game/common.dart';

class TikToeController extends GetxController {
  RxBool playerOne = true.obs;
  RxBool isWinner = false.obs;
  RxBool notWinner = true.obs;
  RxBool refreshScore = false.obs;
  int playerOScore = 0;
  int playerXScore = 0;
  RxInt scoreO = 0.obs;
  RxInt scoreX = 0.obs;
  int filledBoxes = 0;
  List<String> displayElement = [];

  @override
  void onInit() {
    // TODO: implement onInit
    initList();
    getPlayerScoreData();
    super.onInit();
  }

  initList() {
    displayElement.clear();
    filledBoxes = 0;
    notWinner.value = true;
    refreshScore.value = false;
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
      checkPlayer(displayElement[0]);
      Common.commonDialog();
    } else if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != "") {
      isWinner.value = true;
      checkPlayer(displayElement[0]);
      Common.commonDialog();
    } else if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != "") {
      isWinner.value = true;
      checkPlayer(displayElement[0]);
      Common.commonDialog();
    }
    //checking column
    else if (displayElement[2] != "" &&
        displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8]) {
      isWinner.value = true;
      checkPlayer(displayElement[0]);
      Common.commonDialog();
      print(displayElement);
    } else if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != "") {
      isWinner.value = true;
      checkPlayer(displayElement[0]);
      Common.commonDialog();
      print(displayElement);
    } else if (displayElement[1] != "" &&
        displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7]) {
      isWinner.value = true;
      checkPlayer(displayElement[0]);
      Common.commonDialog();
      print(displayElement);
    }
    // side corner check
    else if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != "") {
      isWinner.value = true;
      checkPlayer(displayElement[0]);
      Common.commonDialog();
    } else if (displayElement[2] != "" &&
        displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6]) {
      isWinner.value = true;
      checkPlayer(displayElement[0]);
      Common.commonDialog();
    } else if (filledBoxes == 9) {
      notWinner.value = false;
      Common.commonDialog();
      print(displayElement);
    }
  }

  // check paler score
  checkPlayer(String player) async {
    var sherP = await SharedPreferences.getInstance();
    if (player == "O") {
      scoreO += 10;
      sherP.setInt("scoreO", scoreO.value);
      print("score 0 ${scoreO}");
    } else if (player == "X") {
      scoreX += 10;
      sherP.setInt("scoreX", scoreX.value);
    }
    getPlayerScoreData();
    update();
  }

  // update score player 1 and player 2
  getPlayerScoreData() async {
    var sherP = await SharedPreferences.getInstance();
    playerOScore = sherP.getInt("scoreO") ?? 0;
    playerXScore = sherP.getInt("scoreX") ?? 0;
    update();
  }

  // delete score player 1 and player 2
  refreshPlayerScore() async {
    refreshScore.value = true;
    var sherP = await SharedPreferences.getInstance();
    sherP.remove("scoreO");
    sherP.remove("scoreX");
    scoreX.value = 0;
    scoreO.value = 0;
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    initList();
    super.onClose();
  }
}
