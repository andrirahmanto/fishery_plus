import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fishGrading_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/fish_grading_service.dart';
import 'package:get/get.dart';

class GradingController extends GetxController {
  var isLoading = false.obs;
  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];
  final list_fishGrading = <FishGrading>[].obs;

  @override
  void onInit() async {
    getFishGradings(activation_id: activation.id!);
    super.onInit();
  }

  Future<void> getFishGradings({required String activation_id}) async {
    isLoading.value = true;
    list_fishGrading.clear();
    List<FishGrading> feedHistoryMonthly = await FishGradingService()
        .fetchFishGradings(activationId: activation_id);
    list_fishGrading.addAll(feedHistoryMonthly);
    isLoading.value = false;
  }
}
