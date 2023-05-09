
import 'package:flutter/material.dart';
import 'package:friends/widget/custom_svg.dart';

import '../../resource/app_color.dart';
import '../../utils/app_decoration.dart';

class CustomButtonLogin extends StatelessWidget {
  final String title;
  final bool? isExpand;
  final Color? color;
  final String icons;
  final VoidCallback? onPressed;
  final bool isCloseKeyboardAfterClick;

  const CustomButtonLogin({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isExpand = true,
    this.color,
    required this.icons,
    this.isCloseKeyboardAfterClick = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (isCloseKeyboardAfterClick) FocusScope.of(context).unfocus();
          onPressed!();
        },
        child: Container(
            padding: const EdgeInsets.all(16),
            decoration: _isHasColor()
                ? BoxDecoration(
                color: color,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(16)))
                : AppDecoration.shapeGradiant(
                gradiant: AppColors.createSecondaryGradient(),

                radius: AppDecoration.radiusButton),
            child: Row(
              children: [
                Image.asset(icons),
              //  CustomSvg(path: icons),
                Text(title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ],

            )));
  }

  bool _isHasColor() {
    return color != null;
  }
}
