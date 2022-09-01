// ignore_for_file: public_member_api_docs, sort_constructors_first

class PostUserResponseModel {
  final String name;
  final String job;
  final String id;
  final String createdAt;
  PostUserResponseModel({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  factory PostUserResponseModel.fromJson(Map<String, dynamic> json) {
    return PostUserResponseModel(
      name: json['name'] ?? "no name",
      job: json['job'] ?? "no job",
      id: json['id'] ?? "no id",
      createdAt: json['createdAt'] ?? "no created date",
    );
  }
}
