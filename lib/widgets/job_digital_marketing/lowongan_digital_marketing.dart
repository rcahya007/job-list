// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sanberappflutter/screens/detail_job/detail_job_screen.dart';
import '../loker_container.dart';

import 'package:sanberappflutter/theme.dart';

class LowonganDigitalMarketing extends StatelessWidget {
  List<dynamic>? jobsDigitalMarketing;
  LowonganDigitalMarketing({this.jobsDigitalMarketing, super.key});

  @override
  Widget build(BuildContext context) {
    if (jobsDigitalMarketing == null) {
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
                  'Lowongan Digital Marketing',
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
              itemCount: jobsDigitalMarketing!.length,
              itemBuilder: (context, index) {
                DateTime createJob = DateTime.parse(
                    jobsDigitalMarketing![index]['create_job_date']);
                DateTime updateJob = DateTime.parse(
                    jobsDigitalMarketing![index]['update_job_date']);
                var tampungDate = updateJob.difference(createJob).inDays;
                return GestureDetector(
                  onTap: () {
                    // print('pindah halalama');
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailJobScreen(
                          id: jobsDigitalMarketing![index]['jobs_id'],
                        );
                      },
                    ));
                  },
                  child: LokerContainer(
                    jobTitle: jobsDigitalMarketing![index]['job_title'],
                    companyName: jobsDigitalMarketing![index]['company_name'],
                    jobPlace: jobsDigitalMarketing![index]['job_place'],
                    jobSalary: jobsDigitalMarketing![index]['job_salary'],
                    jobQualification: jobsDigitalMarketing![index]
                        ['job_qualification'],
                    jobPromotion: jobsDigitalMarketing![index]['job_promotion'],
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
