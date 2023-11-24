// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../theme.dart';

class ButtonWhite extends StatelessWidget {
  Text? text;
  VoidCallback? onpress;

  ButtonWhite({super.key, this.text, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
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
        child: text);
  }
}
