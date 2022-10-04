import 'package:fish/models/FeedHistoryMonthly.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/feed_history_service.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  var isLoading = false.obs;
  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];
  final list_feedHistoryMonthly = <FeedHistoryMonthly>[].obs;

  @override
  void onInit() async {
    getWeeklyRecapFeedHistory(activation_id: activation.id!);
    super.onInit();
  }

  Future<void> getWeeklyRecapFeedHistory(
      {required String activation_id}) async {
    isLoading.value = true;
    list_feedHistoryMonthly.clear();
    List<FeedHistoryMonthly> feedHistoryMonthly = await FeedHistoryService()
        .getMonthlyRecap(activation_id: activation_id);
    list_feedHistoryMonthly.addAll(feedHistoryMonthly);
    isLoading.value = false;
  }
}
