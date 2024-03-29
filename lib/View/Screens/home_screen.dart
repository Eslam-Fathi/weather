import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/View/Components/bottom_buttons.dart';
import 'package:weather/View/Components/draggable_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // Keep the state alive

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          child: SvgPicture.asset("assets/svg/svgicon/Plus.svg"),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/png/background/Image2.png', //  Background image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          Align(
            alignment: const Alignment(0, .3),
            child: Image.asset(
              'assets/png/background/House.png', //  House image
              width: 390.w,
              height: 390.h,
              // fit: BoxFit.fill,
            ),
          ),

          // Text Content at the top of the house
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Ismailia',
                  style: TextStyle(
                    fontSize: 34.sp,
                    fontFamily: GoogleFonts.nunitoSans().fontFamily,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '20°',
                  style: TextStyle(
                    fontFamily: GoogleFonts.nunitoSans().fontFamily,
                    fontSize: 96.sp,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Clear",
                  style: TextStyle(
                    fontFamily: GoogleFonts.nunitoSans().fontFamily,
                    fontSize: 20.sp,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  'H: 18°  L: 22°',
                  style: TextStyle(
                    fontFamily: GoogleFonts.nunitoSans().fontFamily,
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const DraggableWeatherWidget(),

          Positioned(
            // floating button background
            left: 0,
            right: 0,
            bottom: -10,
            child: SvgPicture.asset("assets/svg/Back.svg", width: 400.w),
          ),

          Positioned(
            // buttons background
            left: 0,
            right: 0,
            bottom: -10,
            child: SvgPicture.asset("assets/svg/Subtract.svg"),
          ),

          Positioned(
            left: 0,
            right: 300,
            bottom: 20,
            child: BottomButton(
              // location button
              iconlink: "assets/svg/svgicon/Symbol.svg",
              onTap: () {},
            ),
          ),
          Positioned(
            left: 300,
            right: 0,
            bottom: 20,
            child: BottomButton(
              // List button
              iconlink: "assets/svg/svgicon/list.svg",
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
