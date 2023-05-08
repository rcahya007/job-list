import 'package:flutter/material.dart';
import 'package:sanberappflutter/auth/auth_controller.dart';
import '../../theme.dart';
import '../../widgets/button_white.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKeyLogin = GlobalKey<FormState>();
  final authC = Get.find<AuthController>();
  final loginC = Get.put(LoginController());

  bool obscurePassword = true;
  void _tryLogin() {
    final bool isValid = _formKeyLogin.currentState!.validate();
    if (isValid == true) {
      try {
        authC.signin(loginC.emailC.text, loginC.passC.text);
      } catch (e) {
        debugPrint(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Error validasi pada sign in : ${e.toString()}',
            style: TextStyle(
              color: secondaryColor,
            ),
          ),
          backgroundColor: primaryColor,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: defaultMargin,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.offNamed('/index-logreg');
                            },
                            child: const Icon(
                              size: 35,
                              Icons.keyboard_backspace,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              Get.offNamed('/sign-up');
                            },
                            child: Text(
                              'REGISTER',
                              style: headingBlack.copyWith(
                                fontSize: 22,
                                decoration: TextDecoration.underline,
                                height: 1.5,
                                shadows: [
                                  Shadow(
                                      color: primaryColor,
                                      offset: const Offset(0, -5))
                                ],
                                color: Colors.transparent,
                                decorationColor: primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Sign In',
                        style: headingBlack.copyWith(fontSize: 40),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: subTitleBlack.copyWith(fontSize: 16),
                          ),
                          Text(
                            'Welcome back!',
                            style: subTitleBlack.copyWith(fontSize: 22),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 69,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      child: Text(
                        'Enter your email & password',
                        style: subTitleBlack.copyWith(fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Form(
                        key: _formKeyLogin,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter your email address";
                                }
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              controller: loginC.emailC,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  errorStyle: const TextStyle(height: 0.5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  filled: true,
                                  fillColor: secondaryColor,
                                  label: Text(
                                    'Email',
                                    style: subTitleBlack.copyWith(
                                        fontWeight: semiBold,
                                        fontSize: 16,
                                        color: primaryColor.withOpacity(0.5)),
                                  ),
                                  hintText: 'Type your email here ...'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter your password";
                                }
                                return null;
                              },
                              controller: loginC.passC,
                              obscureText: obscurePassword,
                              decoration: InputDecoration(
                                  errorStyle: const TextStyle(height: 0.5),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          obscurePassword = !obscurePassword;
                                        });
                                      },
                                      icon: obscurePassword
                                          ? Icon(
                                              Icons.visibility_off,
                                              color: primaryColor,
                                            )
                                          : Icon(
                                              Icons.visibility,
                                              color: primaryColor,
                                            ),
                                    ),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  filled: true,
                                  fillColor: secondaryColor,
                                  label: Text(
                                    'Password',
                                    style: subTitleBlack.copyWith(
                                        fontWeight: semiBold,
                                        fontSize: 16,
                                        color: primaryColor.withOpacity(0.5)),
                                  ),
                                  hintText: 'Type your password here ...'),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Forgor Password ?',
                                style: subTitle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                  decoration: TextDecoration.underline,
                                  height: 1.5,
                                  shadows: [
                                    Shadow(
                                        color: secondaryColor,
                                        offset: const Offset(0, -5))
                                  ],
                                  color: Colors.transparent,
                                  decorationColor: secondaryColor,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ButtonWhite(
                              onpress: () {
                                _tryLogin();
                              },
                              text: Text(
                                'Sing In',
                                style: headingBlack.copyWith(fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Divider(
                              thickness: 2,
                              color: secondaryColor.withOpacity(0.7),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                fixedSize:
                                    Size(MediaQuery.of(context).size.width, 40),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2,
                                    color: primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/images/logo_google.png'),
                                  Text(
                                    'Continue with Google',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: bold,
                                        color: Colors.black),
                                  ),
                                  Transform.rotate(
                                    angle: 180 * math.pi / 180,
                                    child: const Icon(
                                      Icons.keyboard_backspace,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                fixedSize:
                                    Size(MediaQuery.of(context).size.width, 40),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2,
                                    color: primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                      'assets/images/logo_facebook.png'),
                                  Text(
                                    'Continue with Facebook',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: bold,
                                        color: Colors.black),
                                  ),
                                  Transform.rotate(
                                    angle: 180 * math.pi / 180,
                                    child: const Icon(
                                      Icons.keyboard_backspace,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  void onClose() {
    // TODO: implement onClose
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
