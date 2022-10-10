import 'dart:convert';
import 'dart:ffi';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fishDeath_model.dart';
import 'package:fish/models/fishGrading_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/statistic_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:http/http.dart' as http;

class FishDeathService {
  Future<List<FishDeath>> fetchFishDeaths(
      {required String activationId}) async {
    var url = Uri.parse(Urls.fishDeath(activationId));
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<FishDeath> fishdeath = FishDeath.fromJsonList(data);
      print("success add fishdeath");
      return fishdeath;
    } else {
      throw Exception('Gagal Get fishdeath!');
    }
  }
}
