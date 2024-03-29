import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SmallWeatherWidget extends StatelessWidget {
  const SmallWeatherWidget(
      {super.key,
      required this.timeText,
      required this.temp,
      required this.weather});

  final String timeText;
  final String temp;
  final String weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 60.w,
      decoration: ShapeDecoration(
        shadows: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 3.r,
            spreadRadius: 1.r,
            blurStyle: BlurStyle.normal,
          ),
        ],
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 89, 54, 180),
            Color.fromARGB(255, 54, 42, 132),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.centerRight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              timeText,
              style: TextStyle(
                fontFamily: GoogleFonts.nunitoSans().fontFamily,
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 32.h,
              width: 32.w,
              child: Lottie.asset('assets/lottie/PartlyCloudy.json'),
            ),
            SizedBox(height: 15.h),
            Text(
              "$temp°",
              style: TextStyle(
                fontFamily: GoogleFonts.nunitoSans().fontFamily,
                fontSize: 20.sp,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
