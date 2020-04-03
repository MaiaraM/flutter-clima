import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url);
    print(response.statusCode);
    return response.statusCode == 200 ? jsonDecode(response.body) : "erro";
  }
}
