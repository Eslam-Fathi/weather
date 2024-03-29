import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/View/Components/purple_colored_box.dart';
import 'package:weather/View/Widgets/air_quality_widget.dart';
import 'package:weather/View/Widgets/feels_like_widget.dart';
import 'package:weather/View/Widgets/humidity_widget.dart';
import 'package:weather/View/Widgets/pressure_widget.dart';
import 'package:weather/View/Widgets/rain_fall_widget.dart';
import 'package:weather/View/Widgets/sunrise_widget.dart';
import 'package:weather/View/Widgets/uv_index_widget.dart';
import 'package:weather/View/Widgets/visibilty_widget.dart';
import 'package:weather/View/Widgets/weather_small_widget.dart';
import 'package:weather/View/Widgets/windspeed_widget.dart';

class DraggableContent extends StatefulWidget {
  const DraggableContent({
    super.key,
  });

  @override
  State<DraggableContent> createState() => _DraggableContentState();
}

class _DraggableContentState extends State<DraggableContent>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController controller;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;

  @override
  void initState() {
    super.initState();
    //* Animation controller setup
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    //* Define animations
    _animation1 = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    _animation2 = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _onTabTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      //* Animate to the selected tab
      _selectedIndex == 0 ? controller.reverse() : controller.forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          //* Tab indicator bar
          Container(
            width: 50.w,
            height: 8.h,
            decoration: ShapeDecoration(
              color: const Color.fromARGB(80, 0, 0, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                //* Tab 1: Hourly forecast
                GestureDetector(
                  onTap: () {
                    _onTabTapped(0);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedIndex == 0
                              ? Colors.grey
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Hourly forecast',
                      style: TextStyle(
                        fontFamily: GoogleFonts.nunitoSans().fontFamily,
                        color: Colors.white70,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                //* Tab 2: Weekly Forecast
                GestureDetector(
                  onTap: () {
                    _onTabTapped(1);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _selectedIndex == 1
                              ? Colors.grey
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Weekly Forecast",
                      style: TextStyle(
                        fontFamily: GoogleFonts.nunitoSans().fontFamily,
                        color: Colors.white70,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //* Weather content stack
          Stack(
            children: [
              //* Tab 1 content: Hourly forecast
              AnimatedOpacity(
                opacity: _selectedIndex == 0 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: SlideTransition(
                  position: _animation1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: SizedBox(
                      height: 155.h,
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 4.h,
                            ),
                            child: const SmallWeatherWidget(
                              timeText: 'Now',
                              temp: '20',
                              weather: 'snow',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              //* Tab 2 content: Weekly Forecast
              AnimatedOpacity(
                opacity: _selectedIndex == 1 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: SlideTransition(
                  position: _animation2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: SizedBox(
                      height: 155.h,
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 4.h,
                            ),
                            child: const SmallWeatherWidget(
                              timeText: 'day',
                              temp: '10',
                              weather: 'Sunny',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //* AirQuality Widget
          const PurpleBox(
            height: 158,
            width: 342,
            child: AirQualityWidget(
              selectedaAirQualityIndex: 2,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                //* UVIndex Widget
                const PurpleBox(
                  height: 164,
                  width: 164,
                  child: UVIndex(
                    selectedaUVIndex: 2,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                //* SunRise Widget
                const PurpleBox(
                  height: 164,
                  width: 164,
                  child: SunRise(
                    sunRiseTime: '05:06 AM',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                //* WindSpeed Widget
                const PurpleBox(
                  height: 164,
                  width: 164,
                  child: WindSpeed(),
                ),
                SizedBox(
                  width: 10.w,
                ),
                //* RainFall Widget
                const PurpleBox(
                  height: 164,
                  width: 164,
                  child: RainFall(
                    rainFallChance: 1,
                    willItRain: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                //* FeelsLike Widget
                const PurpleBox(
                  height: 164,
                  width: 164,
                  child: FeelsLike(
                    feelsLike: '20',
                    feelsLikeState: '',
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                //* Humidity Widget
                const PurpleBox(
                  height: 164,
                  width: 164,
                  child: Humidity(
                    humidityFigure: '20',
                    dewPoint: '20',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                //* Visiblity Widget
                const PurpleBox(
                  height: 164,
                  width: 164,
                  child: VisiblityWidget(
                    visabilityFigure: 10,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                //* Pressure Widget
                const PurpleBox(
                  height: 164,
                  width: 164,
                  child: Pressure(
                    pressure: 25,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120.h,
          )
        ],
      ),
    );
  }
}
