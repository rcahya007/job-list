import 'dart:async';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:sanberappflutter/auth/auth_controller.dart';
import 'package:sanberappflutter/routes/route_name.dart';
import '../../theme.dart';

class SplashScreen extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          Timer(
            const Duration(
              seconds: 2,
            ),
            () {
              if (authC.auth.currentUser != null) {
                Get.offAllNamed(RouteName.home);
                Get.snackbar(
                  'Selamat datang ~',
                  'Selamat mencari perkerjaan ~',
                  backgroundColor: secondaryColor,
                  colorText: primaryColor,
                  borderColor: secondaryColor,
                  borderWidth: 2,
                  snackPosition: SnackPosition.BOTTOM,
                  margin: const EdgeInsets.all(10),
                );
              } else {
                Get.offAllNamed(RouteName.intro1Screen);
              }
            },
          );
        }
        return Scaffold(
          backgroundColor: primaryColor,
          body: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(1000))),
                  height: 200,
                  width: 200,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0),
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(1000))),
                      height: 220,
                      width: 220,
                      child: Center(
                        child: Container(),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Logo.png'),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Find & Get Your Dream Job Here',
                      style: headingApp.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(secondaryColor),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(1000))),
                  height: 125,
                  width: 140,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0),
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(1000))),
                      height: 150,
                      width: 150,
                      child: Center(
                        child: Container(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
