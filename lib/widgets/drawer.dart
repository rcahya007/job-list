import 'package:flutter/material.dart';
import 'package:sanberappflutter/auth/auth_controller.dart';
import '../theme.dart';
import 'dart:math' as math;
import 'package:heroicons/heroicons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DrawerCustom extends StatelessWidget {
  DrawerCustom({super.key});
  final authC = Get.find<AuthController>();
  final drawerC = Get.put(DrawerController());

  @override
  Widget build(BuildContext context) {
    List<Widget> subMenu = [
      GestureDetector(
        onTap: () {
          Get.back();
          Get.toNamed('/profile');
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              const HeroIcon(
                HeroIcons.informationCircle,
                size: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Personal Info',
                style: subTitleBlack.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              const HeroIcon(
                HeroIcons.clipboardDocumentList,
                size: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Aplication',
                style: subTitleBlack.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              const HeroIcon(
                HeroIcons.clipboardDocumentCheck,
                size: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Lamayaran Disuka',
                style: subTitleBlack.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              const HeroIcon(
                HeroIcons.wallet,
                size: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Portofolio',
                style: subTitleBlack.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              const HeroIcon(
                HeroIcons.documentText,
                size: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Cover Letters',
                style: subTitleBlack.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              const HeroIcon(
                HeroIcons.cog6Tooth,
                size: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Settings',
                style: subTitleBlack.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          authC.logout();
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Transform.rotate(
                angle: -90 * math.pi / 180,
                child: const HeroIcon(
                  HeroIcons.arrowDownOnSquare,
                  size: 30,
                  color: Color(0xffC61A1A),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Logout',
                style: subTitleBlack.copyWith(
                  fontSize: 16,
                  color: const Color(0xffC61A1A),
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return SizedBox(
      width: 270,
      child: Drawer(
        backgroundColor: primaryColor,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.4,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 30,
                    right: 30,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/profile.png',
                                    height: 150,
                                    width: 150,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => Text(
                            drawerC.name.value,
                            overflow: TextOverflow.ellipsis,
                            style: headingTitle.copyWith(fontSize: 22),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Junior Web Developer',
                              style: subTitle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const HeroIcon(
                              HeroIcons.checkBadge,
                              color: Colors.white,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {},
                          child: Text(
                            'View Profile',
                            style: headingTitle.copyWith(
                              fontSize: 16,
                              color: const Color(0xffFFA31A),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: secondaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return subMenu[index];
                    },
                    itemCount: subMenu.length,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerController extends GetxController {
  final authC = Get.find<AuthController>();
  var name = ''.obs;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
    authC.loaduserdata().then((value) {
      name.value = value['username'];
    });
  }
}
