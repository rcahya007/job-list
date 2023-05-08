import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:sanberappflutter/theme.dart';

class LowonganButuhSegera extends StatelessWidget {
  const LowonganButuhSegera({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Butuh Segera!',
              style: headingTitle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            Text(
              'Lihat Semua',
              style: headingTitle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 90,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 7),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: secondaryColor,
                          ),
                          child: const HeroIcon(
                            HeroIcons.buildingOffice,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Project Manager',
                              style: headingBlack.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'PT. Satu Dua Tiga',
                              style: subTitleBlack.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const HeroIcon(
                          HeroIcons.sparkles,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Dipromosikan',
                          style: subTitleBlack.copyWith(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const HeroIcon(
                              HeroIcons.mapPin,
                              size: 14,
                              style: HeroIconStyle.solid,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Kota Surabaya, Jawa Timur',
                              style: subTitleBlack.copyWith(
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const HeroIcon(
                              HeroIcons.academicCap,
                              size: 14,
                              style: HeroIconStyle.solid,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Minimal S1',
                              style: subTitleBlack.copyWith(
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const HeroIcon(
                              HeroIcons.currencyDollar,
                              size: 14,
                              style: HeroIconStyle.solid,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Rp. 8.000.000',
                              style: subTitleBlack.copyWith(
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const HeroIcon(
                              HeroIcons.informationCircle,
                              size: 14,
                              style: HeroIconStyle.solid,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Terakhir diperbarui 5 hari yang lalu',
                              style: subTitleBlack.copyWith(
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: primaryColor.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(
                          3,
                        ),
                      ),
                      child: const HeroIcon(
                        HeroIcons.share,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 90,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 7),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: secondaryColor,
                          ),
                          child: const HeroIcon(
                            HeroIcons.buildingOffice,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Project Manager',
                              style: headingBlack.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'PT. Satu Dua Tiga',
                              style: subTitleBlack.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const HeroIcon(
                          HeroIcons.sparkles,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Dipromosikan',
                          style: subTitleBlack.copyWith(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const HeroIcon(
                              HeroIcons.mapPin,
                              size: 14,
                              style: HeroIconStyle.solid,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Kota Surabaya, Jawa Timur',
                              style: subTitleBlack.copyWith(
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const HeroIcon(
                              HeroIcons.academicCap,
                              size: 14,
                              style: HeroIconStyle.solid,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Minimal S1',
                              style: subTitleBlack.copyWith(
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const HeroIcon(
                              HeroIcons.currencyDollar,
                              size: 14,
                              style: HeroIconStyle.solid,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Rp. 8.000.000',
                              style: subTitleBlack.copyWith(
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const HeroIcon(
                              HeroIcons.informationCircle,
                              size: 14,
                              style: HeroIconStyle.solid,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Terakhir diperbarui 5 hari yang lalu',
                              style: subTitleBlack.copyWith(
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: primaryColor.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(
                          3,
                        ),
                      ),
                      child: const HeroIcon(
                        HeroIcons.share,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
