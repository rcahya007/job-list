import 'package:flutter/material.dart';
import '../../theme.dart';

class ButtonBlack extends StatelessWidget {
  Text? text;

  VoidCallback? onpress;

  ButtonBlack({super.key, this.text, this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        fixedSize: Size(MediaQuery.of(context).size.width, 40),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      onPressed: onpress,
      child: text,
    );
  }
}
