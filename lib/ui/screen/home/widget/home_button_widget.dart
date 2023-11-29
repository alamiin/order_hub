import 'package:flutter/material.dart';

import '../../../common/text_style.dart';

class HomeButtonWidget extends StatelessWidget {
  final Color color;
  final String name;
  final double size;
  final VoidCallback onPressed;
  const HomeButtonWidget({Key? key, required this.color, required this.name, required this.onPressed, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 8, right: 8, bottom: 8, top: 8),
      child: SizedBox(
        height: size,
        width: size,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            fixedSize: Size(size, size),
            shape: const CircleBorder(),
          ),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: homeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
