import 'package:get/get.dart';

class NavBarController extends GetxController {
  var tabindex = 0;
  void changeTabIndex(int index) {
    tabindex = index;
    update();
  }
}
