import 'dart:math';
import 'package:flutter/material.dart';

class DottedCircularIndicator extends StatelessWidget {
  final double radius;
  final double percentage; // Changed dotCount to percentage
  final double dotSpacing; // Added dot spacing parameter
  final double dotLength; // Added dot length parameter
  final Color color;
  final double strokeWidth; // Added stroke width

  const DottedCircularIndicator({
    super.key,
    required this.radius,
    required this.percentage, // Changed dotCount to percentage
    required this.dotSpacing, // Added dot spacing parameter
    required this.dotLength, // Added dot length parameter
    required this.color,
    required this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: DottedCircularPainter(
        radius: radius,
        // Pass percentage to painter
        dotSpacing: dotSpacing,
        dotLength: dotLength,
        pressure: percentage,
        dotColor: color, strokeWidth: strokeWidth,
      ),
    );
  }
}

class DottedCircularPainter extends CustomPainter {
  final double radius;
  final double pressure;
  final double dotSpacing;
  final double dotLength;
  final Color dotColor;
  final double strokeWidth;

  DottedCircularPainter({
    required this.strokeWidth,
    required this.radius,
    required this.pressure,
    required this.dotSpacing,
    required this.dotLength,
    required this.dotColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double startAngle = -pi / 2; // Start from the top
    const double sweepAngle = pi * 2; // Full circle

    Paint paint = Paint()..strokeWidth = strokeWidth;

    const double angleStep = sweepAngle / 100; // Divide by 100 for percentage

    for (int i = 0; i <= pressure * 2; i++) {
      // Adjust pressure * 2 for better visualization
      double angle = startAngle + angleStep * i;
      double startX = size.width / 2 + radius * cos(angle - dotSpacing / 2);
      double startY = size.height / 2 + radius * sin(angle - dotSpacing / 2);
      double endX = startX + dotLength * cos(angle);
      double endY = startY + dotLength * sin(angle);

      // Draw the purple circle
      paint.color = dotColor;

      // Change color based on pressure value
      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
