import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RainFall extends StatelessWidget {
  const RainFall(
      {super.key, required this.rainFallChance, required this.willItRain});

  final int rainFallChance;
  final int willItRain;

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
                Icons.water_drop,
                size: 15.sp,
                color: Colors.white70,
              ),
              Text(
                " RainFall",
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
            rainFallChance == 0 ? "No rain expected" : "It might rain ",
            style: TextStyle(
                fontFamily: GoogleFonts.abel().fontFamily,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            willItRain == 0
                ? "No rain expected in the next 24h."
                : "It might rain in the next 24h.",
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
