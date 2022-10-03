import 'dart:convert';
import 'dart:ffi';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/statistic_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:http/http.dart' as http;

class ActivationService {
  Future<List<Activation>> getActivations({required String pondId}) async {
    var url = Uri.parse(Urls.activation(pondId));
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Activation> activations = [];

      for (var item in data["pond_activation_list"]) {
        activations.add(Activation.fromJson(item));
      }

      print("success add activations");

      return activations;
    } else {
      throw Exception('Gagal Get Activation!');
    }
  }
}
