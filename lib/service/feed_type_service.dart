import 'dart:convert';
import 'dart:ffi';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/feed_type_model.dart';
import 'package:fish/models/fishDeath_model.dart';
import 'package:fish/models/fishGrading_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/statistic_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:http/http.dart' as http;

class FeedTypeService {
  Future<List<FeedType>> fetchFeedType() async {
    var url = Uri.parse(Urls.feedType);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<FeedType> feedtype = FeedType.fromJsonList(data);
      print("success add feedtype");
      return feedtype;
    } else {
      throw Exception('Gagal Get feedtype!');
    }
  }
}
