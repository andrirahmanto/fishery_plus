import 'package:get/get.dart';

class FishRecapController extends GetxController {
  final List<FishLiveData> charData = [
    FishLiveData(99, '11-01-2022', 'Lele'),
    FishLiveData(87, '12-01-2022', 'Lele'),
    FishLiveData(82, '13-01-2022', 'Nila Merah'),
    FishLiveData(80, '14-01-2022', 'Nila Merah'),
    FishLiveData(70, '15-01-2022', 'Nila Hitam'),
  ].obs;

  var isLoading = false.obs;
}

class FishLiveData {
  FishLiveData(this.amount, this.date, this.type);
  final double amount;
  final String date;
  final String type;
}
