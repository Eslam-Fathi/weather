import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/View/Components/draggble_content_widget.dart';

class DraggableWeatherWidget extends StatefulWidget {
  const DraggableWeatherWidget({super.key});

  @override
  State<DraggableWeatherWidget> createState() => _DraggableWeatherWidgetState();
}

class _DraggableWeatherWidgetState extends State<DraggableWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DraggableScrollableSheet(
            initialChildSize: 0.43,
            minChildSize: .43,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(44.r),
                    ),
                  ),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 89, 54, 180),
                      Color.fromARGB(255, 54, 42, 132),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  controller: scrollController,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const DraggableContent();
                  },
                ),
              );
            });
      },
    );
  }
}
