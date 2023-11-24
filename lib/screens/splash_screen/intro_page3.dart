import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme.dart';
import '../../widgets/button_white.dart';

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(
          bottom: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset('assets/images/third_splash.png'),
            const SizedBox(
              height: 100,
            ),
            Text(
              'Keep Fighting!',
              textAlign: TextAlign.center,
              style: headingTitle.copyWith(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Don’t give up,\n Keep pushing,\n and Good luck!\n\n  Have a nice day ~',
              textAlign: TextAlign.center,
              style: subTitle.copyWith(
                fontSize: 16,
              ),
            ),
            const Spacer(),
            ButtonWhite(
              text: Text(
                'Get Started',
                style: headingBlack.copyWith(
                  fontSize: 16,
                ),
              ),
              onpress: () {
                Get.offAllNamed('/index-logreg');
              },
            )
          ],
        ),
      ),
      backgroundColor: primaryColor,
    );
  }
}
