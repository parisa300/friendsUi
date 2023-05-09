
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class CustomSvg extends StatelessWidget {
  final double? size;
  final Color? color;
  final String path;
  final VoidCallback? onPressed;
  const CustomSvg({
    Key? key,
    required this.path,
    this.color,
    this.onPressed,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(
        path,
        color: color,
        width: size,
        height: size,
      ),
    );
  }
}