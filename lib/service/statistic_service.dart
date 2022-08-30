import 'dart:convert';
import 'package:fish/models/statistic_model.dart';
import 'package:http/http.dart' as http;

class StatisticService {
  String baseUrl = 'http://jft.web.id/fishapi//api';

  Future<StatisticModel> getStatistic() async {
    var url = Uri.parse('$baseUrl/statistic');
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      StatisticModel statistic = StatisticModel.fromJson(data);

      return statistic;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
