import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:sanberappflutter/theme.dart';

class DialogAllCategory extends StatelessWidget {
  const DialogAllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 18,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Semua Kategory',
                            style: headingBlack.copyWith(
                              fontSize: 16,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Text(
                            'Semua bidang kerja dan industri perusahaan',
                            style: subTitleBlack.copyWith(
                              fontSize: 12,
                              color: primaryColor.withOpacity(0.7),
                              decoration: TextDecoration.none,
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const HeroIcon(
                          HeroIcons.xCircle,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        'Bidang Pekerjaan',
                        style: subTitleBlack.copyWith(
                          fontSize: 16,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 66,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      height: 25,
                                      width: 25,
                                      child: const HeroIcon(
                                        HeroIcons.squaresPlus,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
