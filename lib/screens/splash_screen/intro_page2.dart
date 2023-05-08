import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme.dart';
import '../../widgets/button_white.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({super.key});

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
            Image.asset('assets/images/second_splash.png'),
            const SizedBox(
              height: 100,
            ),
            Text(
              'Find Job',
              textAlign: TextAlign.center,
              style: headingTitle.copyWith(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Change your location according to the location where you are, so that we can display jobs according to your choice',
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
                Get.toNamed('/intro-three');
              },
            )
          ],
        ),
      ),
      backgroundColor: primaryColor,
    );
  }
}
