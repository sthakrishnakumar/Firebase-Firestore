// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetUsersModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  GetUsersModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory GetUsersModel.fromJson(Map<String, dynamic> json) {
    return GetUsersModel(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? 'no name',
      lastName: json['last_name'] ?? 'no last name',
      avatar: json['avatar'] ?? '',
    );
  }
}
