// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Global_Controller/Global_Controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String datetime = DateFormat('yMMMMd').format(DateTime.now());
  String city = "";

  GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(
      globalController.getLatitude().value,
      globalController.getLongitude().value,
    );
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> places = await placemarkFromCoordinates(lat, lon);
    Placemark place = places[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.only(top: 15, left: 20),
      child: Column(
        children: [
          Text(
            city,
            style: GoogleFonts.abel(
              fontSize: 60,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            datetime,
            style: GoogleFonts.andika(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
