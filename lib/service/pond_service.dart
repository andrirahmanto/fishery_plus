import 'dart:convert';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/statistic_model.dart';
import 'package:http/http.dart' as http;

class PondService {
  String baseUrl = 'http://jft.web.id/fishapi//api';

  Future<List<Pond>> getPonds() async {
    var url = Uri.parse('$baseUrl/ponds');
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Pond> ponds = [];

      for (var item in data) {
        ponds.add(Pond.fromJson(item));
      }

      print(ponds);

      return ponds;
    } else {
      throw Exception('Gagal Get Ponds!');
    }
  }
}
