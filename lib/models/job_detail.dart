class JobDetail {
  int? jobs_id;
  int? companies_id;
  int? job_details_id;
  String? job_title;
  String? job_requirements;
  String? job_place;
  String? job_type_condition;
  int? job_salary;
  bool? job_promotion;
  String? company_name;
  String? company_about;
  String? company_no;
  int? company_time_acc;
  String? company_category;
  String? company_additional;
  String? company_place;
  String? intro_job_desc;
  String? job_desc;
  String? job_weekday;
  String? job_time;
  String? job_criteria;
  String? job_level;
  String? job_experience;
  String? job_qualification;
  String? job_type;
  String? job_spesialis;

  JobDetail({
    this.jobs_id,
    this.companies_id,
    this.job_details_id,
    this.job_title,
    this.job_requirements,
    this.job_place,
    this.job_type_condition,
    this.job_salary,
    this.job_promotion,
    this.company_name,
    this.company_about,
    this.company_no,
    this.company_time_acc,
    this.company_category,
    this.company_additional,
    this.company_place,
    this.intro_job_desc,
    this.job_desc,
    this.job_weekday,
    this.job_time,
    this.job_criteria,
    this.job_level,
    this.job_experience,
    this.job_qualification,
    this.job_type,
    this.job_spesialis,
  });

  factory JobDetail.fromJson(Map<String, dynamic> json) {
    return JobDetail(
      jobs_id: json['data']['jobs_id'],
      companies_id: json['data']['companies_id'],
      job_details_id: json['data']['job_details_id'],
      job_title: json['data']['job_title'],
      job_requirements: json['data']['job_requirements'],
      job_place: json['data']['job_place'],
      job_type_condition: json['data']['job_type_condition'],
      job_salary: json['data']['job_salary'],
      job_promotion: json['data']['job_promotion'],
      company_name: json['data']['company_name'],
      company_about: json['data']['company_about'],
      company_no: json['data']['company_no'],
      company_time_acc: json['data']['company_time_acc'],
      company_category: json['data']['company_category'],
      company_additional: json['data']['company_additional'],
      company_place: json['data']['company_place'],
      intro_job_desc: json['data']['intro_job_desc'],
      job_desc: json['data']['job_desc'],
      job_weekday: json['data']['job_weekday'],
      job_time: json['data']['job_time'],
      job_criteria: json['data']['job_criteria'],
      job_level: json['data']['job_level'],
      job_experience: json['data']['job_experience'],
      job_qualification: json['data']['job_qualification'],
      job_type: json['data']['job_type'],
      job_spesialis: json['data']['job_spesialis'],
    );
  }
}
