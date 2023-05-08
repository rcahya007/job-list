import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:sanberappflutter/theme.dart';
import 'package:sanberappflutter/utils/convert_currency.dart';

class LokerContainer extends StatelessWidget {
  String? jobTitle;
  String? companyName;
  int? jobPromotion;
  String? jobPlace;
  String? jobQualification;
  int? jobSalary;
  int? tampungDate;
  LokerContainer(
      {this.jobTitle,
      this.companyName,
      this.jobPromotion,
      this.jobPlace,
      this.jobQualification,
      this.jobSalary,
      this.tampungDate,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
                SizedBox(
                  width: 175,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jobTitle.toString(),
                        style: headingBlack.copyWith(
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      Text(
                        companyName.toString(),
                        style: subTitleBlack.copyWith(
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: (jobPromotion == 0)
                      ? []
                      : [
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
                          jobPlace.toString(),
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
                          'Minimal $jobQualification',
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
                      children: (jobSalary == 0)
                          ? [
                              const HeroIcon(
                                HeroIcons.currencyDollar,
                                size: 14,
                                style: HeroIconStyle.solid,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Negotiable",
                                style: subTitleBlack.copyWith(
                                  fontSize: 9,
                                ),
                              ),
                            ]
                          : [
                              const HeroIcon(
                                HeroIcons.currencyDollar,
                                size: 14,
                                style: HeroIconStyle.solid,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                CurrencyFormat.convertToIdr(jobSalary, 0),
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
                          'Terakhir diperbarui $tampungDate hari yang lalu',
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
    );
  }
}
