// ignore_for_file: public_member_api_docs, sort_constructors_first
class BookAppointmentModel {
  final String name;
  final String date;
  final String time;
  BookAppointmentModel({
    required this.name,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'date': date,
      'time': time,
    };
  }

  factory BookAppointmentModel.fromJson(Map<String, dynamic> json) {
    return BookAppointmentModel(
      name: json['name'],
      date: json['date'],
      time: json['time'],
    );
  }
}
