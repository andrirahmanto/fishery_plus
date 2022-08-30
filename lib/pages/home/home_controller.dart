import 'dart:async';

import 'package:fish/models/statistic_model.dart';
import 'package:fish/service/statistic_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _statistic = StatisticModel().obs;

  StatisticModel? get statistic => _statistic();

  @override
  void onInit() {
    getStatisticData();

    super.onInit();
  }

  Future<void> getStatisticData() async {
    var statistic = await StatisticService().getStatistic();
    _statistic(statistic);
  }
}
