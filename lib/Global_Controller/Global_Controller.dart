// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/API/fetch_api.dart';
import 'package:weather_app/models/weather_data.dart';

class GlobalController extends GetxController {
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxBool isLoading = true.obs;
  RxInt cardIndex = 0.obs;
  RxBool checkLoading() => isLoading;
  RxDouble getLatitude() => latitude;
  RxDouble getLongitude() => longitude;
  final weatherdata = WeatherData().obs;

  getIndex() {
    return cardIndex;
  }

  WeatherData getWeatherData() {
    return weatherdata.value;
  }

  @override
  void onInit() {
    if (isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  getLocation() async {
    bool isLocationServicesEnabled;
    LocationPermission locationPermission;
    isLocationServicesEnabled = await Geolocator.isLocationServiceEnabled();

    locationPermission = await Geolocator.checkPermission();

    if (!isLocationServicesEnabled) {
      return Future.error("Location Disabled");
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Permissions denied Forever");
    } else {
      locationPermission == LocationPermission.denied;
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Permisson Denied");
      }
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((value) {
      latitude.value = value.latitude;
      longitude.value = value.longitude;
      return FetchWeatherData().fetchData(value.latitude, value.longitude).then(
        (value) {
          weatherdata.value = value;
          isLoading.value = false;
        },
      );
    });
  }
}
