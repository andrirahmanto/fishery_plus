import 'package:get/get.dart';

class FishTypeController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "Lele".obs;
  final listFish = ["Lele", "Nila Merah", "Nila Hitam", "Mas"];

  void setSelected(String value) {
    selected.value = value;
  }
}
