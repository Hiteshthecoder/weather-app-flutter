// ignore_for_file: must_be_immutable, implementation_imports, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/Global_Controller/Global_Controller.dart';
import 'package:weather_app/models/weather/current.dart';

class SleekCircularWidget extends StatelessWidget {
  SleekCircularWidget({
    super.key,
    required this.weatherDataCurrent,
  });
  final WeatherDataCurrent weatherDataCurrent;
  GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: SizedBox(
            height: 180,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
