import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/button_white.dart';
import 'package:get/get.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Image.asset('assets/images/first_splash.png'),
            const SizedBox(
              height: 100,
            ),
            Text(
              'Hello, Welcome to Job List!',
              textAlign: TextAlign.center,
              style: headingTitle.copyWith(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'We help you to find your dream job accordind to your skillset, location & preference to build your career.',
              textAlign: TextAlign.center,
              style: subTitle.copyWith(
                fontSize: 16,
              ),
            ),
            const Spacer(),
            ButtonWhite(
              text: Text(
                'Next',
                style: headingBlack.copyWith(
                  fontSize: 16,
                ),
              ),
              onpress: () {
                Get.toNamed('/intro-two');
              },
            )
          ],
        ),
      ),
      backgroundColor: primaryColor,
    );
  }
}
