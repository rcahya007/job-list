import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:sanberappflutter/auth/auth_controller.dart';
import 'package:sanberappflutter/theme.dart';
import 'package:sanberappflutter/widgets/button_white.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileUser extends StatelessWidget {
  ProfileUser({super.key});
  final authC = Get.find<AuthController>();

  List<String> tech = [
    'assets/images/Flutter.png',
    'assets/images/Javascript.png',
    'assets/images/PHP.png',
    'assets/images/TailwindCSS.png',
    'assets/images/React.png',
    'assets/images/laravel.png',
    'assets/images/html5.png',
    'assets/images/css.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      size: 30,
                      Icons.keyboard_backspace,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'PROFILE',
                    style: headingTitle.copyWith(
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                            image: NetworkImage('https://i.pravatar.cc/300'),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          child: const HeroIcon(
                            HeroIcons.camera,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff7D7D7D).withOpacity(0.9),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '0',
                                style: headingTitle.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Lowongan disuka',
                                style: subTitle.copyWith(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff7D7D7D).withOpacity(0.9),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '0',
                                style: headingTitle.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Riwayat Lamaran',
                                style: subTitle.copyWith(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonWhite(
                onpress: () {},
                text: Text(
                  'Unggah CV',
                  style: headingBlack.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeroIcon(
                        HeroIcons.userCircle,
                        size: 30,
                        color: Colors.white,
                        style: HeroIconStyle.solid,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: subTitleBlack.copyWith(
                                fontSize: 14,
                                color: secondaryColor,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  authC.auth.currentUser!.displayName
                                      .toString(),
                                  style: headingTitle.copyWith(
                                    fontSize: 16,
                                    color: secondaryColor,
                                  ),
                                ),
                                const HeroIcon(
                                  HeroIcons.pencilSquare,
                                  color: Colors.white,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeroIcon(
                        HeroIcons.envelope,
                        size: 30,
                        color: Colors.white,
                        style: HeroIconStyle.solid,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: subTitleBlack.copyWith(
                                fontSize: 14,
                                color: secondaryColor,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  authC.auth.currentUser!.email.toString(),
                                  style: headingTitle.copyWith(
                                    fontSize: 16,
                                    color: secondaryColor,
                                  ),
                                ),
                                const HeroIcon(
                                  HeroIcons.pencilSquare,
                                  color: Colors.white,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sosial Media',
                    style: headingTitle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.facebook,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Rendy Cahya E',
                          style: subTitle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        'Connected',
                        style: subTitle.copyWith(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.instagram,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'rendycahya_',
                          style: subTitle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        'Connected',
                        style: subTitle.copyWith(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.twitter,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'RendyCahyaE',
                          style: subTitle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        'Connected',
                        style: subTitle.copyWith(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Text(
                    'Tech',
                    style: headingTitle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 35,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tech.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Image.asset(tech[index]),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  authC.logout();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const RotatedBox(
                          quarterTurns: 3,
                          child: HeroIcon(
                            HeroIcons.arrowUpTray,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'LOGOUT',
                          style: headingBlack.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
