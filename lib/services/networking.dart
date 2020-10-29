import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  final String url;

  NetworkHelper(this.url);

  Future getWeatherData() async {

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String body = response.body;
      return jsonDecode(body);
    } else {
      print(response.statusCode);
    }
  }

}