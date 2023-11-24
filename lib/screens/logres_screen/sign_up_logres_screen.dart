import 'package:flutter/material.dart';
import 'package:sanberappflutter/auth/auth_controller.dart';
import 'package:sanberappflutter/widgets/button_black.dart';
import '../../theme.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKeyRegis = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureRePassword = true;
  final authC = Get.find<AuthController>();
  final signUpC = Get.put(SignUpController());

  void _submitRegis() async {
    final bool isValid = _formKeyRegis.currentState!.validate();
    if (isValid == true) {
      try {
        authC.signup(
          signUpC.emailC.text,
          signUpC.passC.text,
          signUpC.nameC.text,
        );
      } catch (e) {
        debugPrint(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Error validasi pada sign up : ${e.toString()}',
            style: TextStyle(
              color: primaryColor,
            ),
          ),
          backgroundColor: secondaryColor,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(defaultMargin),
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
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              Get.offNamed('/sign-in');
                            },
                            child: Text(
                              'LOGIN',
                              style: headingBlack.copyWith(
                                fontSize: 22,
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
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 57,
                      ),
                      Text(
                        'Sign Up',
                        style: headingTitle.copyWith(
                          fontSize: 40,
                          color: secondaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Create your account to get started',
                        style: subTitle.copyWith(
                          fontSize: 16,
                          color: secondaryColor,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        defaultMargin,
                        0,
                        defaultMargin,
                        12,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Please fill your information bellow',
                          style: subTitle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Form(
                        key: _formKeyRegis,
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
                              controller: signUpC.emailC,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  errorStyle: const TextStyle(height: 0.5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xffB8B8B8),
                                  label: Text(
                                    'Email',
                                    style: subTitleBlack.copyWith(
                                        fontWeight: semiBold,
                                        fontSize: 16,
                                        color: primaryColor.withOpacity(0.6)),
                                  ),
                                  hintText: 'Type your email here ...'),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter your name";
                                }
                                if (value.length < 5) {
                                  return "Please give name min 5 character";
                                }
                                return null;
                              },
                              controller: signUpC.nameC,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  errorStyle: const TextStyle(height: 0.5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xffB8B8B8),
                                  label: Text(
                                    'Name',
                                    style: subTitleBlack.copyWith(
                                        fontWeight: semiBold,
                                        fontSize: 16,
                                        color: primaryColor.withOpacity(0.6)),
                                  ),
                                  hintText: 'Type your name here ...'),
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
                              controller: signUpC.passC,
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  errorStyle: const TextStyle(height: 0.5),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscurePassword = !_obscurePassword;
                                        });
                                      },
                                      icon: _obscurePassword
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
                                  fillColor: const Color(0xffB8B8B8),
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
                              height: 15,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter your Re-password";
                                }
                                if (value != signUpC.passC.text) {
                                  return "Password not same!";
                                }
                                return null;
                              },
                              controller: signUpC.rePassC,
                              obscureText: _obscureRePassword,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  errorStyle: const TextStyle(height: 0.5),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscureRePassword =
                                              !_obscureRePassword;
                                        });
                                      },
                                      icon: _obscureRePassword
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
                                  fillColor: const Color(0xffB8B8B8),
                                  label: Text(
                                    'Re-Password',
                                    style: subTitleBlack.copyWith(
                                        fontWeight: semiBold,
                                        fontSize: 16,
                                        color: primaryColor.withOpacity(0.5)),
                                  ),
                                  hintText: 'Type your Re-password here ...'),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            ButtonBlack(
                              text: Text(
                                'Sign Up',
                                style: headingTitle.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              onpress: () {
                                _submitRegis();
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: subTitleBlack.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: () {
                                    Get.offNamed('/sign-in');
                                  },
                                  child: Text(
                                    'Login',
                                    style: headingBlack.copyWith(
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      height: 1.5,
                                      shadows: [
                                        Shadow(
                                          color: primaryColor,
                                          offset: const Offset(0, -2),
                                        ),
                                      ],
                                      color: Colors.transparent,
                                      decorationColor: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
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

class SignUpController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController rePassC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    nameC.dispose();
    rePassC.dispose();
    super.onClose();
  }
}
