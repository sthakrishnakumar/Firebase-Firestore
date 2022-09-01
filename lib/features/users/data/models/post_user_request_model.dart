// ignore_for_file: public_member_api_docs, sort_constructors_first

class PostUserRequestModel {
  final String name;
  final String job;
  PostUserRequestModel({
    required this.name,
    required this.job,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'job': job,
    };
  }
}
