




import 'package:flutter/material.dart';
import '../../resource/app_color.dart';
import '../../utils/app_decoration.dart';

class CustomBtnAbout extends StatelessWidget {
  final String title;
  final bool? isExpand;
  final Color? color;
  final String icons;
  final VoidCallback? onPressed;
  final bool isCloseKeyboardAfterClick;

  const CustomBtnAbout({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isExpand = true,
    this.color,
    this.icons="",
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
         height: 36,
          decoration: _isHasColor()
              ? BoxDecoration(
              color: color,
              border: Border.all(color: AppColors.colorApp, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(36)))
              : AppDecoration.shapeGradiant(
              gradiant: AppColors.createSecondaryGradient(),

              radius: AppDecoration.radiusButton),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 8,),
             Image.asset(icons),
           SizedBox(width: 8,),
              Text(title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
              const SizedBox(width: 16),

            ],
          ),));
  }

  bool _isHasColor() {
    return color != null;
  }
}
