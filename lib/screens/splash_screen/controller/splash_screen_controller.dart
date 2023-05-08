import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }

  void checkAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    User? user = auth.currentUser;
    if (user != null) {
      Get.offAllNamed('/home');
      Get.snackbar("Welcome", 'Hello...');
    } else {
      Get.offAllNamed('/intro-one');
    }
  }
}
