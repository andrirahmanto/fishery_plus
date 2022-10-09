import 'dart:convert';
import 'dart:ffi';
import 'package:fish/models/FeedHistoryDaily.dart';
import 'package:fish/models/FeedHistoryHourly.dart';
import 'package:fish/models/FeedHistoryMonthly.dart';
import 'package:fish/models/FeedHistoryWeekly.dart';
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

  Future<List<FeedHistoryWeekly>> getWeeklyRecap(
      {required String activation_id, required String month}) async {
    var url = Uri.parse(Urls.feedHistoryWeekly(activation_id, month));
    print(url);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<FeedHistoryWeekly> feedHistoryWeekly =
          FeedHistoryWeekly.fromJsonList(data);
      return feedHistoryWeekly;
    } else {
      throw Exception('Gagal Get Activation!');
    }
  }

  Future<List<FeedHistoryDaily>> getDailyRecap(
      {required String activation_id, required String week}) async {
    var url = Uri.parse(Urls.feedHistoryDaily(activation_id, week));
    print(url);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<FeedHistoryDaily> feedHistoryDaily =
          FeedHistoryDaily.fromJsonList(data);
      return feedHistoryDaily;
    } else {
      throw Exception('Gagal Get Activation!');
    }
  }

  Future<List<FeedHistoryHourly>> getHourlyRecap(
      {required String activation_id, required String date}) async {
    var url = Uri.parse(Urls.feedHistory(activation_id, date));
    print(url);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<FeedHistoryHourly> feedHistoryHourly =
          FeedHistoryHourly.fromJsonList(data);
      return feedHistoryHourly;
    } else {
      throw Exception('Gagal Get Activation!');
    }
  }
}
