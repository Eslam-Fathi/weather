import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurpleBox extends StatelessWidget {
  const PurpleBox({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });
  final double height;
  final double width;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color.fromARGB(255, 48, 22, 140)),
          borderRadius: BorderRadius.circular(22.r),
        ),
        color: const Color.fromARGB(190, 31, 29, 71),
      ),
      child: child,
    );
  }
}
