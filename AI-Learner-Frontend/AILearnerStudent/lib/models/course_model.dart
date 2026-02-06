class CourseModel {
  final String id;
  final String title;
  final String aim;
  final String theory;
  final String videoUrl;
  final String conclusion;
  final String coverImagePath;

  CourseModel({
    required this.id,
    required this.title,
    required this.aim,
    required this.theory,
    required this.videoUrl,
    required this.conclusion,
    required this.coverImagePath,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      aim: json['aim'],
      theory: json['theory'],
      videoUrl: json['videoUrl'],
      conclusion: json['conclusion'],
      coverImagePath: json['coverImagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['aim'] = this.aim;
    data['theory'] = this.theory;
    data['videoUrl'] = this.videoUrl;
    data['conclusion'] = this.conclusion;
    data['coverImagePath'] = this.coverImagePath;
    return data;
  }
}
