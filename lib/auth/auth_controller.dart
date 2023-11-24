import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sanberappflutter/routes/route_name.dart';
import 'package:sanberappflutter/theme.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  loaduserdata() async {
    try {
      CollectionReference usersRef =
          FirebaseFirestore.instance.collection('users');
      final snapshot = await usersRef.doc(auth.currentUser!.uid).get();
      final data = snapshot.data() as Map<String, dynamic>;
      debugPrint('ini adalah RETURN DATA $data');
      return data;
      // debugPrint(data['username']);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void signup(String email, String password, String name) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint('Berhasil Daftar');
      debugPrint('ini adalah data user ${credential.user.toString()}');
      debugPrint('ini adalah nama user ${credential.user!.displayName}');
      await credential.user!.updateDisplayName(name);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'username': name,
        'uid': credential.user!.uid,
      });
      Get.offNamed(RouteName.home);
      Get.snackbar(
        'Success ~',
        'Selamat mencari pekerjaan ~',
        backgroundColor: secondaryColor,
        colorText: primaryColor,
        borderColor: secondaryColor,
        borderWidth: 2,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        Get.snackbar(
          'Warning !',
          'Password terlalu lemah !',
          backgroundColor: primaryColor,
          colorText: Colors.white,
          borderColor: primaryColor,
          borderWidth: 2,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(10),
        );
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        Get.snackbar(
          'Warning !',
          'Email sudah digunakan !',
          backgroundColor: primaryColor,
          colorText: Colors.white,
          borderColor: primaryColor,
          borderWidth: 2,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(10),
        );
      }
    } catch (e) {
      debugPrint('Error Try sign up ${e.toString()}');
    }
  }

  void signin(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint('berhasil login');
      Get.snackbar(
        'Welcome back~',
        'Selamat mencari perkerjaan!',
        backgroundColor: primaryColor,
        colorText: Colors.white,
        borderColor: secondaryColor,
        borderWidth: 2,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );
      Get.offAllNamed(RouteName.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        Get.snackbar(
          'Warning!',
          'User Tidak ada!',
          backgroundColor: primaryColor,
          colorText: Colors.white,
          borderColor: secondaryColor,
          borderWidth: 2,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(10),
        );
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        Get.snackbar(
          'Warning!',
          'Password Salah!',
          backgroundColor: primaryColor,
          colorText: Colors.white,
          borderColor: secondaryColor,
          borderWidth: 2,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(10),
        );
      }
    } catch (e) {
      debugPrint('Error Try sign in ${e.toString()}');
    }
  }

  void logout() async {
    await auth.signOut();
    Get.snackbar(
      'Success ~',
      'Silakan login kembali ~',
      backgroundColor: secondaryColor,
      colorText: primaryColor,
      borderColor: primaryColor,
      borderWidth: 2,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
    );
    Get.offAllNamed('sign-in');
  }
}
