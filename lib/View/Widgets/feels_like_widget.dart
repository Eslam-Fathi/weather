import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FeelsLike extends StatelessWidget {
  const FeelsLike(
      {super.key, required this.feelsLike, required this.feelsLikeState});

  final String feelsLike;
  final String feelsLikeState;

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
              // Icon(
              //   Icons.,
              //   size: 15.sp,
              //   color: Colors.white70,
              // ),
              FaIcon(
                FontAwesomeIcons.temperatureHalf,
                color: Colors.white70,
                size: 15.sp,
              ),
              Text(
                " FeelsLike",
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
            "$feelsLike°C",
            style: TextStyle(
                fontFamily: GoogleFonts.abel().fontFamily,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            feelsLikeState,
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
