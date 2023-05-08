import 'package:flutter/material.dart';
import 'package:sanberappflutter/screens/detail_job/detail_job_screen.dart';
import '../loker_container.dart';

import 'package:sanberappflutter/theme.dart';

class LowonganStaffResto extends StatelessWidget {
  List<dynamic>? jobStaffResto;
  LowonganStaffResto({this.jobStaffResto, super.key});

  @override
  Widget build(BuildContext context) {
    if (jobStaffResto == null) {
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
              Flexible(
                flex: 1,
                child: Text(
                  'Lowongan Staff Restoran',
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
              itemCount: jobStaffResto!.length,
              itemBuilder: (context, index) {
                DateTime createJob =
                    DateTime.parse(jobStaffResto![index]['create_job_date']);
                DateTime updateJob =
                    DateTime.parse(jobStaffResto![index]['update_job_date']);
                var tampungDate = updateJob.difference(createJob).inDays;
                return GestureDetector(
                  onTap: () {
                    // print('pindah halalama');
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailJobScreen(
                          id: int.parse(jobStaffResto![index]['jobs_id']),
                        );
                      },
                    ));
                  },
                  child: LokerContainer(
                    jobTitle: jobStaffResto![index]['job_title'],
                    companyName: jobStaffResto![index]['company_name'],
                    jobPlace: jobStaffResto![index]['job_place'],
                    jobSalary: int.parse(jobStaffResto![index]['job_salary']),
                    jobQualification: jobStaffResto![index]
                        ['job_qualification'],
                    jobPromotion:
                        int.parse(jobStaffResto![index]['job_promotion']),
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
