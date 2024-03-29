import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/View/Components/colored_indicator.dart';

class UVIndex extends StatelessWidget {
  const UVIndex({super.key, required this.selectedaUVIndex});

  static const Map<int, String> uVIndexes = {
    0: "0-Good",
    1: "1-Moderate",
    2: "2-Unhealthy",
    3: "3-Unhealthy",
    4: "4-Very Unhealthy",
    5: "5-Hazardous",
    6: "6-Very Hazardous",
    7: "7-Extremely Hazardous",
    8: "8-Severe",
    9: "9-Very Severe",
    10: "10-Extreme",
  };

  final int selectedaUVIndex;

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
              Icon(
                Icons.sunny,
                size: 15.sp,
                color: Colors.white70,
              ),
              Text(
                ' UV Index',
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
            uVIndexes[selectedaUVIndex] ??
                "Unknown", // Select risk level from the map,,
            style: TextStyle(
                fontFamily: GoogleFonts.abel().fontFamily,
                color: Colors.white,
                fontSize: 22.sp),
          ),
          SizedBox(height: 10.h),
          LineIndicator(
            width: 150.w,
            height: 6.h,
            dotSize: 6,
            dotColor: Colors.white,
            position:
                selectedaUVIndex, // Initial position of the dot (0.0 to 1.0)
          ),
        ],
      ),
    );
  }
}
