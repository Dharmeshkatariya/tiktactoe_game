import 'package:get/get.dart';
import 'package:tiktoe_game/controller/tiktoe_controller.dart';

class TikacToeScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TikToeController>(() => TikToeController());
    // TODO: implement dependencies
  }

}