// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sanberappflutter/screens/detail_job/detail_job_screen.dart';
import '../loker_container.dart';

import 'package:sanberappflutter/theme.dart';

class LowonganS1 extends StatelessWidget {
  List<dynamic>? jobS1;
  LowonganS1({this.jobS1, super.key});

  @override
  Widget build(BuildContext context) {
    if (jobS1 == null) {
      return const Column(
        children: [
          SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          )
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lowongan Lulusan S1',
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
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: jobS1!.length,
              itemBuilder: (context, index) {
                DateTime createJob =
                    DateTime.parse(jobS1![index]['create_job_date']);
                DateTime updateJob =
                    DateTime.parse(jobS1![index]['update_job_date']);
                var tampungDate = updateJob.difference(createJob).inDays;
                return GestureDetector(
                  onTap: () {
                    // print('pindah halalama');
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailJobScreen(
                          id: jobS1![index]['jobs_id'],
                        );
                      },
                    ));
                  },
                  child: LokerContainer(
                    jobTitle: jobS1![index]['job_title'],
                    companyName: jobS1![index]['company_name'],
                    jobPlace: jobS1![index]['job_place'],
                    jobSalary: jobS1![index]['job_salary'],
                    jobQualification: jobS1![index]['job_qualification'],
                    jobPromotion: jobS1![index]['job_promotion'],
                    tampungDate: tampungDate,
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }
}
