// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Global_Controller/Global_Controller.dart';
import 'package:weather_app/widgets/Header_Widget.dart';
import 'package:weather_app/widgets/Hourly_Weather_Widget_and_daily_forecast.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/sleek_circular_slider.dart';

class HOmeScreen extends StatefulWidget {
  const HOmeScreen({super.key});

  @override
  State<HOmeScreen> createState() => _HOmeScreenState();
}

class _HOmeScreenState extends State<HOmeScreen> {
  GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      HeaderWidget(),
                      currentWeatherWidget(
                          weatherDataCurrent: globalController
                              .getWeatherData()
                              .getCurrentWeather()),
                      HourlyWeatherWidget(
                        weatherDataHourly: globalController
                            .getWeatherData()
                            .getWeatherDataHoury(),
                      ),
                      SleekCircularWidget(
                        weatherDataCurrent: globalController
                            .getWeatherData()
                            .getCurrentWeather(),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
