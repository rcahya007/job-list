class Jobs {
  int? jobs_id;
  int? companies_id;
  String? job_title;
  String? job_requirements;
  String? job_place;
  String? job_type_condition;
  int? job_salary;
  bool? job_promotion;
  String? created_at;
  String? updated_at;
  String? company_name;
  String? company_about;
  String? company_no;
  String? company_size;
  int? company_time_acc;
  String? company_category;
  String? company_additional;
  String? company_place;

  Jobs({
    this.jobs_id,
    this.companies_id,
    this.job_title,
    this.job_requirements,
    this.job_place,
    this.job_type_condition,
    this.job_salary,
    this.job_promotion,
    this.created_at,
    this.updated_at,
    this.company_name,
    this.company_about,
    this.company_no,
    this.company_size,
    this.company_time_acc,
    this.company_category,
    this.company_additional,
    this.company_place,
  });

  factory Jobs.fromJson(Map<String, dynamic> json) {
    return Jobs(
      jobs_id: json['data']['jobs_id'],
      companies_id: json['data']['companies_id'],
      job_title: json['data']['job_title'],
      job_requirements: json['data']['job_requirements'],
      job_place: json['data']['job_place'],
      job_type_condition: json['data']['job_type_condition'],
      job_salary: json['data']['job_salary'],
      job_promotion: json['data']['job_promotion'],
      created_at: json['data']['created_at'],
      updated_at: json['data']['updated_at'],
      company_name: json['data']['company_name'],
      company_about: json['data']['company_about'],
      company_no: json['data']['company_no'],
      company_size: json['data']['company_size'],
      company_time_acc: json['data']['company_time_acc'],
      company_category: json['data']['company_category'],
      company_additional: json['data']['company_additional'],
      company_place: json['data']['company_place'],
    );
  }
}
