import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineIndicator extends StatelessWidget {
  final double width;
  final double height;
  final double dotSize;
  final Color dotColor;
  final int position; // Position of the dot relative to the width (1 to 10)

  const LineIndicator({
    super.key,
    required this.width,
    required this.height,
    required this.dotSize,
    required this.dotColor,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.r)),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 72, 49, 157),
                Color.fromARGB(255, 196, 39, 251),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          width: width,
          height: height,
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300), // Animation duration
          left: (position == 10)
              ? width - dotSize - 16.w // Set left position to the right end
              : position /
                  10.0 *
                  (width - dotSize), // Calculate left position of the dot
          top: height / 2 - dotSize / 2, // Align dot vertically at the center
          child: Container(
            width: dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dotColor,
            ),
          ),
        ),
      ],
    );
  }
}
