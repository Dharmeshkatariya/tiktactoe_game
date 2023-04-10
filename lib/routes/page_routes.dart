import 'package:get/get.dart';
import 'package:tiktoe_game/bindings/tiktoescreen_binding.dart';
import 'package:tiktoe_game/routes/name_routes.dart';
import 'package:tiktoe_game/screen/tiktoescreen.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: NameRoute.tikToeScreen,
      page: () =>  TikToeScreen(),
      binding: TikacToeScreenBinding()
    ),
  ];
}
