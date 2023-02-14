import 'package:http/http.dart' as http;

class HttpService {
  static Future<http.Response> getRequest(var lat, var lan) async {
    http.Response response;
    String url =
        "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lan&appid=111e76f07e2c48a7d42b3fedbf8f9f4f&units=metric";
    print(url);
    try {
      response = await http.get(Uri.parse(url));
    } on Exception {
      rethrow;
    }

    return response;
  }
}
