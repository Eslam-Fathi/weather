import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.iconlink,
    required this.onTap,
  });
  final String iconlink;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(iconlink),
    );
  }
}
