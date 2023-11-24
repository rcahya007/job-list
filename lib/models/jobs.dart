class Jobs {
  int? jobs_id;
  String? company_name;
  String? job_title;
  String? job_place;
  int? job_salary;
  String? job_qualification;
  String? create_job_date;
  String? update_job_date;
  bool? job_promotion;

  Jobs({
    this.jobs_id,
    this.company_name,
    this.job_title,
    this.job_place,
    this.job_salary,
    this.job_qualification,
    this.create_job_date,
    this.update_job_date,
    this.job_promotion,
  });

  factory Jobs.fromJson(Map<String, dynamic> json) {
    return Jobs(
      jobs_id: json['data']['jobs_id'],
      company_name: json['data']['company_name'],
      job_title: json['data']['job_title'],
      job_place: json['data']['job_place'],
      job_salary: json['data']['job_salary'],
      job_qualification: json['data']['job_qualification'],
      create_job_date: json['data']['create_job_date'],
      update_job_date: json['data']['update_job_date'],
      job_promotion: json['data']['job_promotion'],
    );
  }
}
