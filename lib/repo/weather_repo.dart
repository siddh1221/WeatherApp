import 'dart:io';

import 'package:weatherapp/model/weather_model.dart';

import '../service/http_service.dart';

class WeatherRespository {
  Future<WeatherModel?> getWeather(var lat, var lan) async {
    try {
      final response = await HttpService.getRequest(lat, lan);
      // print(response.body);
      if (response.statusCode == 200) {
        final result = weatherModelFromJson(response.body);
        return result;
      } else {
        return null;
      }
    } on SocketException {
      rethrow;
    } on HttpException {
      rethrow;
    } on FormatException {
      rethrow;
    }
  }
}
