import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:sanberappflutter/models/job_detail.dart';
import 'package:sanberappflutter/theme.dart';
import 'package:sanberappflutter/widgets/button_white.dart';
import 'package:http/http.dart' as http;
import 'package:sanberappflutter/utils/convert_currency.dart';

class DetailJobScreen extends StatefulWidget {
  final List<dynamic>? jobDetail;
  final int? id;
  const DetailJobScreen({this.jobDetail, this.id, super.key});

  @override
  State<DetailJobScreen> createState() => _DetailJobScreenState();
}

class _DetailJobScreenState extends State<DetailJobScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  Future getDetailJob() async {
    var fetch = await http.get(
      Uri.parse(
          "https://www.sanber.app.rendycahyae.my.id/api/jobs/${widget.id}"),
      headers: {'Accept': 'application/json'},
    );
    var data = json.decode(fetch.body)["data"];
    data.map((get) => JobDetail.fromJson(get));
    data as List<dynamic>;

    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Image.asset('assets/images/logo_landscape.png'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: const Border(
            bottom: BorderSide(
          color: Colors.white,
          width: 1,
        )),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getDetailJob(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(child: CircularProgressIndicator()));
            } else {
              List<dynamic> jobDetail = snapshot.data;
              List<dynamic> jobDesc = json.decode(jobDetail[0]['job_desc']);
              List<dynamic> jobCriteria =
                  json.decode(jobDetail[0]['job_criteria']);
              List<dynamic> jobReq =
                  json.decode(jobDetail[0]['job_requirements']);
              DateTime createJob =
                  DateTime.parse(jobDetail[0]['create_job_date']);
              DateTime updateJob =
                  DateTime.parse(jobDetail[0]['update_job_date']);
              var tampungDate = updateJob.difference(createJob).inDays;
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        defaultMargin, 15, defaultMargin, 0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                size: 30,
                                Icons.keyboard_backspace,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: secondaryColor,
                                  ),
                                  child: const HeroIcon(
                                    HeroIcons.buildingOffice,
                                    size: 75,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  jobDetail[0]['job_title'],
                                  style: headingTitle.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  jobDetail[0]['company_name'],
                                  style: subTitle.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: secondaryColor,
                                  ),
                                  child: const HeroIcon(
                                    HeroIcons.heart,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: secondaryColor,
                                  ),
                                  child: const HeroIcon(
                                    HeroIcons.ellipsisVertical,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 35,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: jobReq.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 15),
                                height: 30,
                                decoration: BoxDecoration(
                                  color: secondaryColor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 6),
                                  child: Text(
                                    jobReq[index],
                                    style: subTitle.copyWith(fontSize: 12),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const HeroIcon(
                                  HeroIcons.mapPin,
                                  size: 20,
                                  color: Colors.white,
                                  style: HeroIconStyle.solid,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  jobDetail[0]['job_place'],
                                  style: subTitle.copyWith(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const HeroIcon(
                                  HeroIcons.clipboardDocumentCheck,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  jobDetail[0]['job_type_condition'],
                                  style: subTitle.copyWith(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const HeroIcon(
                                  HeroIcons.academicCap,
                                  size: 20,
                                  color: Colors.white,
                                  style: HeroIconStyle.solid,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Minimal ${jobDetail[0]['job_qualification']}',
                                  style: subTitle.copyWith(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const HeroIcon(
                                  HeroIcons.currencyDollar,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  (jobDetail[0]['job_salary'] == 0)
                                      ? 'Negotiable'
                                      : CurrencyFormat.convertToIdr(
                                          int.parse(jobDetail[0]['job_salary']),
                                          0),
                                  style: subTitle.copyWith(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const HeroIcon(
                                  HeroIcons.informationCircle,
                                  size: 20,
                                  color: Colors.white,
                                  style: HeroIconStyle.solid,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Terakhir diperbarui $tampungDate hari yang lalu',
                                  style: subTitle.copyWith(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Color(0xff434240),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: TabBar(
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              indicatorColor: secondaryColor,
                              controller: _tabController,
                              labelStyle: headingTitle.copyWith(
                                fontSize: 12,
                                color: secondaryColor,
                              ),
                              unselectedLabelColor:
                                  secondaryColor.withOpacity(0.4),
                              tabs: const [
                                Tab(
                                  child: Text(
                                    'Deskripsi',
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Kualifikasi',
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Tentang',
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Lowongan Perusahaan',
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                // DESKRIPSI
                                ListView(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Deskripsi Pekerjaan',
                                            style: headingTitle.copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            (jobDetail[0]['intro_job_desc'] ==
                                                    null)
                                                ? ''
                                                : '${jobDetail[0]['intro_job_desc']}',
                                            style: headingTitle.copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                          Column(
                                            children: jobDesc.map((job) {
                                              return Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "\u2022",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: secondaryColor,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      child: Text(
                                                        job,
                                                        textAlign:
                                                            TextAlign.left,
                                                        softWrap: true,
                                                        style:
                                                            subTitle.copyWith(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'Hari Kerja',
                                                maxLines: null,
                                                style: headingTitle.copyWith(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'Jam Kerja',
                                                style: headingTitle.copyWith(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                jobDetail[0]['job_weekday'],
                                                style: subTitle.copyWith(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                jobDetail[0]['job_time'],
                                                style: subTitle.copyWith(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                // Kualifikasi
                                ListView(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Kualifikasi',
                                            style: headingTitle.copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                            children: jobCriteria.map((job) {
                                              return Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "\u2022",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: secondaryColor,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      child: Text(
                                                        job,
                                                        textAlign:
                                                            TextAlign.left,
                                                        softWrap: true,
                                                        style:
                                                            subTitle.copyWith(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              );
                                            }).toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Informasi Tambahan',
                                          style: headingTitle.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Tingkat Pekerjaan',
                                                    style:
                                                        headingTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    jobDetail[0]['job_level'],
                                                    style: subTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Kualifikasi',
                                                    style:
                                                        headingTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    jobDetail[0]
                                                        ['job_qualification'],
                                                    style: subTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Pengalaman Pekerjaan',
                                                    style:
                                                        headingTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Minimal ${jobDetail[0]['job_experience']}',
                                                    style: subTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Jenis Pekerjaan',
                                                    style:
                                                        headingTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    jobDetail[0]
                                                        ['job_type_condition'],
                                                    style: subTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Spesialis Pekerjaan',
                                              style: headingTitle.copyWith(
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              jobDetail[0]['job_spesialis'],
                                              style: subTitle.copyWith(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Tentang
                                ListView(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tentang Perusahaan',
                                            style: headingTitle.copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Column(children: [
                                            Text(
                                              jobDetail[0]['company_about'],
                                              textAlign: TextAlign.left,
                                              softWrap: true,
                                              style: subTitle.copyWith(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Informasi Tambahan Perusahaan',
                                          style: headingTitle.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'No. Registrasi',
                                                    style:
                                                        headingTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    jobDetail[0]['company_no'],
                                                    style: subTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Ukuran Perusahaan',
                                                    style:
                                                        headingTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    jobDetail[0]
                                                        ['company_size'],
                                                    style: subTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Waktu Proses Lamaran',
                                                    style:
                                                        headingTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${jobDetail[0]['company_time_acc']} - hari',
                                                    style: subTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Industri',
                                                    style:
                                                        headingTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    jobDetail[0]
                                                        ['company_category'],
                                                    style: subTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Tambahan dan Lain-lain',
                                                    style:
                                                        headingTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${jobDetail[0]['company_additional']}',
                                                    style: subTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Lokasi',
                                                    style:
                                                        headingTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    jobDetail[0]
                                                        ['company_place'],
                                                    style: subTitle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                // second tab bar view widget
                                const Center(
                                  child: Text(
                                    'Coming Soon',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            30,
            5,
            30,
            5,
          ),
          child: ButtonWhite(
            onpress: () {},
            text: Text(
              'Lamar Sekarang',
              style: headingBlack.copyWith(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
