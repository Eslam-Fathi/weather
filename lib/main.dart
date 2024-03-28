import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/View/Screens/home_screen.dart';

void main() {
  runApp(const ForecastApp());
}

class ForecastApp extends StatelessWidget {
  const ForecastApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) => const MaterialApp(
        home: Scaffold(
          body: HomeScreen(),
        ),
      ),
      designSize: const Size(390, 844),
    );
  }
}
