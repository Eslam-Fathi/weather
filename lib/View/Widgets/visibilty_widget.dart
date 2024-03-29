import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

class VisiblityWidget extends StatelessWidget {
  const VisiblityWidget({super.key, required this.visabilityFigure});

  final int visabilityFigure;

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
                Icons.visibility,
                size: 15.sp,
                color: Colors.white70,
              ),
              Text(
                " Visiblity",
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
            "$visabilityFigure km",
            style: TextStyle(
                fontFamily: GoogleFonts.abel().fontFamily,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            visabilityFigure > 1
                ? "Visiablity is clear."
                : "Visiablity is not clear.",
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
