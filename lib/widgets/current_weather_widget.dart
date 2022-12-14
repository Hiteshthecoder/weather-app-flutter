// ignore_for_file: unnecessary_string_interpolations, camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Colors/custom-colors.dart';
import 'package:weather_app/models/weather/current.dart';

class currentWeatherWidget extends StatelessWidget {
  currentWeatherWidget({super.key, required this.weatherDataCurrent});
  final WeatherDataCurrent weatherDataCurrent;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TempratureWidget(),
      SizedBox(
        height: 20,
      ),
      MoreWeatherAreaWidget,
    ]);
  }

  Widget TempratureWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.network(
          '${weatherDataCurrent.current.condition!.icon!.replaceAll(
            "//",
            "https://",
          )}',
          scale: 0.6,
        ),
        Container(
          width: 1,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${weatherDataCurrent.current.tempC}°c",
                style: GoogleFonts.kanit(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              TextSpan(
                text: "${weatherDataCurrent.current.condition!.text}",
                style: GoogleFonts.heebo(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get MoreWeatherAreaWidget {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(18),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColors.dividerLine,
                  ),
                  child: Image.asset(
                    'assets/icons/windspeed.png',
                  ),
                ),
                Text(
                  "${weatherDataCurrent.current.windKph}KM/h",
                  style: GoogleFonts.lora(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(
                    18,
                  ),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColors.dividerLine,
                  ),
                  child: Image.asset(
                    'assets/icons/humidity.png',
                  ),
                ),
                Text(
                  "${weatherDataCurrent.current.humidity}%",
                  style: GoogleFonts.lora(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(18),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColors.dividerLine,
                  ),
                  child: Image.asset(
                    'assets/icons/co2.png',
                  ),
                ),
                Text(
                  "${weatherDataCurrent.current.airQuality!.co}%",
                  style: GoogleFonts.lora(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(18),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColors.dividerLine,
                  ),
                  child: Image.asset(
                    'assets/icons/uv-icon.png',
                  ),
                ),
                Text(
                  "${weatherDataCurrent.current.uv}",
                  style: GoogleFonts.lora(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
