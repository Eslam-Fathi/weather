import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:weather/View/Components/colored_indicator.dart';

class AirQualityWidget extends StatelessWidget {
  static const Map<int, String> airQualityIndexes = {
    0: "0-Good",
    1: "1-Moderate",
    2: "2-Unhealthy for Sensitive Groups",
    3: "3-Unhealthy",
    4: "4-Very Unhealthy",
    5: "5-Hazardous",
    6: "6-Very Hazardous",
    7: "7-Extremely Hazardous",
    8: "8-Severe",
    9: "9-Very Severe",
    10: "10-Extreme",
  };

  final int
      selectedaAirQualityIndex; // This value should be provided from another widget

  const AirQualityWidget({
    super.key,
    required this.selectedaAirQualityIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.wind_power_outlined,
                size: 15.sp,
                color: Colors.white70,
              ),
              Text(
                " Air Quality",
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
          //Risk indicator
          Text(
            airQualityIndexes[selectedaAirQualityIndex] ??
                "Unknown", // Select risk level from the map
            style: TextStyle(
                fontFamily: GoogleFonts.abel().fontFamily,
                color: Colors.white,
                fontSize: 22.sp),
          ),
          SizedBox(height: 10.h),
          LineIndicator(
            width: 328.w,
            height: 6.h,
            dotSize: 6,
            dotColor: Colors.white,
            position:
                selectedaAirQualityIndex, // Normalize position to 0.0 to 1.0
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
            child: const Divider(
              color: Colors.white38,
            ),
          ),
          Row(
            children: [
              Text(
                "See more",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
