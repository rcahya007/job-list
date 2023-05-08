import 'package:flutter/material.dart';
import 'package:sanberappflutter/screens/detail_job/detail_job_screen.dart';
import '../loker_container.dart';

import 'package:sanberappflutter/theme.dart';

class LowonganPilihan extends StatelessWidget {
  List<dynamic>? jobPromo;
  LowonganPilihan({this.jobPromo, super.key});

  @override
  Widget build(BuildContext context) {
    if (jobPromo == null) {
      return Column(
        children: const [
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
                'Lowongan Pilihan',
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
              itemCount: jobPromo!.length,
              itemBuilder: (context, index) {
                DateTime createJob =
                    DateTime.parse(jobPromo![index]['create_job_date']);
                DateTime updateJob =
                    DateTime.parse(jobPromo![index]['update_job_date']);
                var tampungDate = updateJob.difference(createJob).inDays;
                return GestureDetector(
                  onTap: () {
                    // print('pindah halalama');
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailJobScreen(
                          id: int.parse(jobPromo![index]['jobs_id']),
                        );
                      },
                    ));
                  },
                  child: LokerContainer(
                    jobTitle: jobPromo![index]['job_title'],
                    companyName: jobPromo![index]['company_name'],
                    jobPlace: jobPromo![index]['job_place'],
                    jobSalary: int.parse(jobPromo![index]['job_salary']),
                    jobQualification: jobPromo![index]['job_qualification'],
                    jobPromotion: int.parse(jobPromo![index]['job_promotion']),
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
