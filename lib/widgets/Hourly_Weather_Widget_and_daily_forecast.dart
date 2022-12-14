// ignore_for_file: prefer_const_constructors_in_immutables, file_names, unrelated_type_equality_checks, must_be_immutable, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps, unused_local_variable, non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Colors/custom-colors.dart';
import 'package:weather_app/Global_Controller/Global_Controller.dart';
import 'package:weather_app/models/weather/forecast.dart';

class HourlyWeatherWidget extends StatelessWidget {
  HourlyWeatherWidget({super.key, required this.weatherDataHourly});
  final WeatherDataHourly weatherDataHourly;
  GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  RxInt cardIndex = GlobalController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 25,
          ),
          child: Text(
            "Today",
            style: GoogleFonts.artifika(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        HourlyWatherList(),
        DailyWeatherForecast(
          weatherDataHourly:
              globalController.getWeatherData().getWeatherDataHoury(),
        ),
      ],
    );
  }

  Widget HourlyWatherList() {
    final String imageUrl;
    return Container(
      height: 150,
      margin: const EdgeInsets.only(
        top: 10,
      ),
      // padding: const EdgeInsets.only(top: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.forecast.forecastday?[0].hour?.length,
        itemBuilder: (context, index) {
          return Obx(
            (() => GestureDetector(
                  onTap: () {
                    cardIndex.value = index;
                  },
                  child: Container(
                    width: 90,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: cardIndex == index
                          ? CustomColors.secondGradientColor.withAlpha(200)
                          : CustomColors.dividerLine,
                    ),
                    child: HourlyWeatherDataItems(
                      weatherIcon: weatherDataHourly
                          .forecast.forecastday![0].hour![index].condition!.icon
                          .toString()
                          .replaceAll("//", "https://"),
                      temp: weatherDataHourly
                          .forecast.forecastday?[0].hour?[index].tempC
                          .toString(),
                      day: weatherDataHourly
                          .forecast.forecastday?[0].hour?[index].time
                          .toString()
                          .split(' ')[1],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}

class HourlyWeatherDataItems extends StatelessWidget {
  var temp;
  String weatherIcon;
  var day;

  HourlyWeatherDataItems({
    super.key,
    required this.day,
    required this.temp,
    required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          day,
          style: GoogleFonts.baloo2(
            fontSize: 18,
          ),
        ),
        Image.network(
          weatherIcon,
          scale: 0.7,
        ),
        Text(
          '${temp}*c',
          style: GoogleFonts.bayon(
            fontSize: 15,
          ),
        )
      ],
    );
  }
}

class DailyWeatherForecast extends StatelessWidget {
  DailyWeatherForecast(
      {super.key, required this.weatherDataHourly, this.IconUrl});

  final WeatherDataHourly weatherDataHourly;

  final IconUrl;

  getDay(day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String dayName = DateFormat('EEE').format(time);
    return dayName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      margin: EdgeInsets.only(top: 25, right: 10, left: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(
          150,
        ),
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              "Next Days",
              style: GoogleFonts.robotoSlab(
                fontSize: 18,
              ),
            ),
          ),
          DailyForcastList(),
        ],
      ),
    );
  }

  Widget DailyForcastList() {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: weatherDataHourly.forecast.forecastday!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              DailyForcastData(
                iconurl: weatherDataHourly
                    .forecast.forecastday![index].day!.condition!.icon
                    .toString()
                    .replaceAll(
                      "//",
                      "https://",
                    ),
                temprature: weatherDataHourly
                    .forecast.forecastday![index].hour![index].tempC,
                day: getDay(
                    weatherDataHourly.forecast.forecastday![index].dateEpoch),
              ),
              Container(
                height: 1,
                color: CustomColors.dividerLine,
              ),
            ],
          );
        },
      ),
    );
  }
}

class DailyForcastData extends StatelessWidget {
  DailyForcastData({super.key, this.iconurl, this.day, this.temprature});

  final iconurl;
  final day;
  final temprature;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          day,
          style: GoogleFonts.robotoFlex(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        Image.network(
          iconurl,
        ),
        Text(
          '${temprature.toString()}°c',
          style: GoogleFonts.aladin(
            fontWeight: FontWeight.w100,
          ),
        ),
      ],
    );
  }
}
