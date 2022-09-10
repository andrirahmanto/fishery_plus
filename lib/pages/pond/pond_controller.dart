import 'dart:async';

import 'package:fish/models/pond_model.dart';
import 'package:fish/service/pond_service.dart';
import 'package:get/get.dart';

class PondController extends GetxController {
  var isLoading = false.obs;
  final ponds = <Pond>[].obs;

  @override
  void onInit() async {
    await getPondsData();
    super.onInit();
  }

  Future<void> getPondsData() async {
    isLoading.value = true;
    List<Pond> pondsData = await PondService().getPonds();
    ponds.addAll(pondsData);

    isLoading.value = false;
  }
}
