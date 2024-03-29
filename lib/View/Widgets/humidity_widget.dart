import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';

class Humidity extends StatelessWidget {
  const Humidity(
      {super.key, required this.humidityFigure, required this.dewPoint});

  final String humidityFigure;
  final String dewPoint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BoxedIcon(
                WeatherIcons.humidity,
                color: Colors.white70,
                size: 15.sp,
              ),
              Text(
                "Humidity",
                style: TextStyle(
                  fontFamily: GoogleFonts.nunitoSans().fontFamily,
                  color: Colors.white70,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "$humidityFigure%",
            style: TextStyle(
                fontFamily: GoogleFonts.abel().fontFamily,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            "The dew point is $dewPoint \nright now.",
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: GoogleFonts.abel().fontFamily,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
