import 'dart:async';

import 'package:fish/pages/dashboard.dart';
import 'package:fish/pages/home/home_page.dart';
import 'package:fish/pages/pond/pond_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    Timer(const Duration(seconds: 2), () {
      Get.off(const DashboardPage());
    });
  }
}
