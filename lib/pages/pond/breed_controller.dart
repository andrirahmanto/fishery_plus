import 'package:fish/models/activation_model.dart';
import 'package:get/get.dart';

class BreedController extends GetxController {
  var isLoading = false.obs;
  Activation activation = Get.arguments;
}
