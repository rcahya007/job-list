import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sanberappflutter/auth/auth_controller.dart';
import 'package:sanberappflutter/models/jobs%20copy.dart';
import 'package:sanberappflutter/widgets/job_sales/lowongan_sales.dart';
import '../../widgets/job_category/jobs_category.dart';
import '../../widgets/drawer.dart';
import '../../theme.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:sanberappflutter/widgets/job_pilihan/lowongan_pilihan.dart';
import 'package:sanberappflutter/widgets/job_s1/lowongan_s1.dart';
import 'package:sanberappflutter/widgets/job_staff_restoran/lowongan_staf_restoran.dart';
import 'package:sanberappflutter/widgets/job_it/lowongan_it.dart';
import 'package:sanberappflutter/widgets/job_admin/lowongan_admin.dart';
import 'package:sanberappflutter/widgets/job_digital_marketing/lowongan_digital_marketing.dart';

import 'package:http/http.dart' as http;

class KarierScreen extends StatefulWidget {
  const KarierScreen({super.key});

  @override
  State<KarierScreen> createState() => _KarierScreenState();
}

class _KarierScreenState extends State<KarierScreen> {
  final authC = Get.find<AuthController>();
  final authK = Get.put(KarrierController());
  var name = ''.obs;

  @override
  void initState() {
    super.initState();
    authC.loaduserdata().then((value) {
      name.value = value['username'];
    });
  }

  GlobalKey<ScaffoldState> keyDrawer = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: keyDrawer,
        backgroundColor: primaryColor,
        drawer: DrawerCustom(),
        body: Padding(
          padding: EdgeInsets.only(
            bottom: 0,
            left: defaultMargin,
            right: defaultMargin,
            top: 10,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: subTitle.copyWith(fontSize: 14),
                          ),
                          Obx(
                            () => Text(
                              name.value,
                              style: headingTitle.copyWith(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          keyDrawer.currentState!.openDrawer();
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 40,
                              ),
                            ),
                            Positioned(
                              top: -5,
                              right: -5,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '1',
                                  style: subTitle.copyWith(
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter your email address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(
                              height: 0.5,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: secondaryColor,
                            label: Text(
                              "Cari pekerjaan & posisi",
                              style: subTitleBlack.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const HeroIcon(
                          HeroIcons.adjustmentsVertical,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Expanded(
                child: GlowingOverscrollIndicator(
                  axisDirection: AxisDirection.down,
                  color: Colors.transparent,
                  showLeading: false,
                  showTrailing: false,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const Column(
                        children: [
                          JobCategory(),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      FutureBuilder(
                        future: authK.cobaGetJobs(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Column(
                              children: [
                                SizedBox(
                                  height: 500,
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                )
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                LowonganPilihan(jobPromo: authK.jobPromo),
                                const SizedBox(
                                  height: 15,
                                ),
                                LowonganS1(jobS1: authK.jobS1),
                                const SizedBox(
                                  height: 15,
                                ),
                                LowonganSales(
                                  jobSales: authK.jobSales,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                LowonganStaffResto(
                                  jobStaffResto: authK.jobStaffResto,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                LowonganAdmin(
                                  jobsAdmin: authK.jobsAdmin,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                LowonganIt(
                                  jobsIt: authK.jobsIt,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                LowonganDigitalMarketing(
                                  jobsDigitalMarketing:
                                      authK.jobsDigitalMarketing,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KarrierController extends GetxController {
  var jobPromo = [].obs;
  var jobS1 = [].obs;
  var jobSales = [].obs;
  var jobStaffResto = [].obs;
  var jobsAdmin = [].obs;
  var jobsIt = [].obs;
  var jobsDigitalMarketing = [].obs;

  Future cobaGetJobs() async {
    var hasil = await http.get(
      Uri.parse("https://joblist.opwarnet.my.id/api/jobs"),
      headers: {'Accept': 'application/json'},
    );
    var dataJobsPromo = json.decode(hasil.body)["jobs_promo"];
    dataJobsPromo.map((p) => Jobs.fromJson(p));
    dataJobsPromo as List<dynamic>;
    jobPromo.value = dataJobsPromo;

    var dataJobS1 = json.decode(hasil.body)["jobs_s1"];
    dataJobS1.map((p) => Jobs.fromJson(p));
    dataJobS1 as List<dynamic>;
    jobS1.value = dataJobS1;

    var dataJobSales = json.decode(hasil.body)["jobs_sales"];
    dataJobSales.map((p) => Jobs.fromJson(p));
    dataJobSales as List<dynamic>;
    jobSales.value = dataJobSales;

    var dataJobStafResto = json.decode(hasil.body)["jobs_staff_resto"];
    dataJobStafResto.map((p) => Jobs.fromJson(p));
    dataJobStafResto as List<dynamic>;
    jobStaffResto.value = dataJobStafResto;

    var dataJobsAdmin = json.decode(hasil.body)["jobs_admin"];
    dataJobsAdmin.map((p) => Jobs.fromJson(p));
    dataJobsAdmin as List<dynamic>;
    jobsAdmin.value = dataJobsAdmin;

    var dataJobsIt = json.decode(hasil.body)["jobs_it"];
    dataJobsIt.map((p) => Jobs.fromJson(p));
    dataJobsIt as List<dynamic>;
    jobsIt.value = dataJobsIt;

    var dataJobsDigitalMarketing =
        json.decode(hasil.body)["job_digital_marketing"];
    dataJobsDigitalMarketing.map((p) => Jobs.fromJson(p));
    dataJobsDigitalMarketing as List<dynamic>;
    jobsDigitalMarketing.value = dataJobsDigitalMarketing;
  }
}
