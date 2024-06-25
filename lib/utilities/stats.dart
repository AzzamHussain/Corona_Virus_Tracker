import 'dart:convert';

import 'package:coronavirus/utilities/Api_url.dart';
import 'package:http/http.dart' as http;

class Stats {
  Future getWorldStats() async {
    var response = await http.get(Uri.parse(AppUrl.worldURL));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception("Error");
    }
  }

  Future getCountryStats() async {
    var response = await http.get(Uri.parse(AppUrl.countryURL));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception("Error");
    }
  }
}
