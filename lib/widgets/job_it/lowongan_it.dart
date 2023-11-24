// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sanberappflutter/screens/detail_job/detail_job_screen.dart';
import '../loker_container.dart';

import 'package:sanberappflutter/theme.dart';

class LowonganIt extends StatelessWidget {
  List<dynamic>? jobsIt;
  LowonganIt({this.jobsIt, super.key});

  @override
  Widget build(BuildContext context) {
    if (jobsIt == null) {
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
              Flexible(
                flex: 1,
                child: Text(
                  'Lowongan IT',
                  style: headingTitle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
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
              itemCount: jobsIt!.length,
              itemBuilder: (context, index) {
                DateTime createJob =
                    DateTime.parse(jobsIt![index]['create_job_date']);
                DateTime updateJob =
                    DateTime.parse(jobsIt![index]['update_job_date']);
                var tampungDate = updateJob.difference(createJob).inDays;
                return GestureDetector(
                  onTap: () {
                    // print('pindah halalama');
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailJobScreen(
                          id: jobsIt![index]['jobs_id'],
                        );
                      },
                    ));
                  },
                  child: LokerContainer(
                    jobTitle: jobsIt![index]['job_title'],
                    companyName: jobsIt![index]['company_name'],
                    jobPlace: jobsIt![index]['job_place'],
                    jobSalary: jobsIt![index]['job_salary'],
                    jobQualification: jobsIt![index]['job_qualification'],
                    jobPromotion: jobsIt![index]['job_promotion'],
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
