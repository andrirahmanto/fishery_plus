import 'dart:convert';
import 'dart:ffi';
import 'package:fish/models/FeedHistoryMonthly.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/statistic_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:http/http.dart' as http;

class FeedHistoryService {
  Future<List<FeedHistoryMonthly>> getMonthlyRecap(
      {required String activation_id}) async {
    var url = Uri.parse(Urls.feedHistoryMonthly(activation_id));
    print(url);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<FeedHistoryMonthly> feedHistoryMonthly =
          FeedHistoryMonthly.fromJsonList(data);
      return feedHistoryMonthly;
    } else {
      throw Exception('Gagal Get Activation!');
    }
  }
}
