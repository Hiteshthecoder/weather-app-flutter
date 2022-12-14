// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/models/weather/current.dart';
import 'package:weather_app/models/weather/forecast.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:http/http.dart' as http;

class FetchWeatherData {
  WeatherData? weatherData;

  Future<WeatherData> fetchData(lat, lon) async {
    List<Placemark> places = await placemarkFromCoordinates(lat, lon);
    Placemark place = places[0];
    String City = place.locality.toString();
    var response = await http.get(Uri.parse(ApiUrl(City)));
    var jsonString = jsonDecode(response.body);

    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
    );
    return weatherData!;
  }
}

String ApiUrl(city) {
  String Api =
      "http://api.weatherapi.com/v1/forecast.json?key=bb835a67be674731b9a102511220212&q=$city&days=7&aqi=yes&alerts=yes";
  return Api;
}
