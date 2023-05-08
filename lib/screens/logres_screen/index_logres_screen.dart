import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';
import '../../widgets/button_black.dart';
import '../../widgets/button_white.dart';

class IndexLogresScreen extends StatelessWidget {
  const IndexLogresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Container(
            height: 90,
          ),
          Image.asset('assets/images/Logo.png'),
          Container(
            height: 20,
          ),
          Text(
            'Find & Get Your Dream Job Here',
            style: headingApp.copyWith(
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            padding: EdgeInsets.only(
              top: 20,
              right: defaultMargin,
              left: defaultMargin,
              bottom: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WELCOME',
                  style: headingBlack.copyWith(fontSize: 30),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'We currently have over 1000 live roles waiting for you!',
                  style: subTitleBlack.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonWhite(
                  text: Text(
                    'Create Account',
                    style: headingBlack.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  onpress: () {
                    Get.toNamed('/sign-up');
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Already have an account?',
                    style: headingBlack.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonBlack(
                  onpress: () {
                    Get.toNamed('/sign-in');
                  },
                  text: Text(
                    'Sign In',
                    style:
                        buttonStyle.copyWith(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
