import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/View/Components/barometer.dart';

import 'package:weather_icons/weather_icons.dart';

class Pressure extends StatelessWidget {
  const Pressure({super.key, required this.pressure});

  final double pressure;

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
                WeatherIcons.barometer,
                color: Colors.white70,
                size: 15.sp,
              ),
              Text(
                "Pressure",
                style: TextStyle(
                  fontFamily: GoogleFonts.nunitoSans().fontFamily,
                  color: Colors.white70,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const DottedCircularIndicator(
                  radius: 50,
                  // dotCount: 50,
                  dotSpacing: 0.2, // Adjust the spacing between dots
                  dotLength: 5,
                  color: Colors.white70,
                  percentage: 100,
                  strokeWidth: 1,
                ),
                DottedCircularIndicator(
                  radius: 50,
                  // dotCount: 50,
                  dotSpacing: 0.2, // Adjust the spacing between dots
                  dotLength: 5,
                  color: const Color.fromARGB(255, 143, 21, 223),
                  percentage: pressure,
                  strokeWidth: 1.5,
                ),
                Text(
                  '$pressure',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontFamily: GoogleFonts.nunitoSans().fontFamily,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
