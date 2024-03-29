import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_icons/weather_icons.dart';

class SunRise extends StatelessWidget {
  const SunRise({super.key, required this.sunRiseTime});

  final String sunRiseTime;

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
                WeatherIcons.sunrise,
                color: Colors.white70,
                size: 15.sp,
              ),
              Text(
                " Sunrise",
                style: TextStyle(
                  fontFamily: GoogleFonts.nunitoSans().fontFamily,
                  color: Colors.white70,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            sunRiseTime,
            style: TextStyle(
                fontFamily: GoogleFonts.abel().fontFamily,
                color: Colors.white,
                fontSize: 35.sp),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
