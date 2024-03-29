import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WindSpeed extends StatelessWidget {
  const WindSpeed({super.key});

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
              FaIcon(
                FontAwesomeIcons.wind,
                color: Colors.white70,
                size: 15.sp,
              ),
              Text(
                " Wind",
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
          Center(
            child: SizedBox(
              height: 100.h,
              width: 100.w,
              child: SvgPicture.asset("assets/svg/speedometer.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
