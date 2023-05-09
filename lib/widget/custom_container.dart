

import 'package:flutter/material.dart';


class CustomContainer extends StatelessWidget {

  final String ? icon;

  const CustomContainer({
    Key? key,

    this.icon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(16),
        decoration:
        BoxDecoration(border: Border.all(color: Colors.grey, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Image.asset(icon!)
    );
  }
}

