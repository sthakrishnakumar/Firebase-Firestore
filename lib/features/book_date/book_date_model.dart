// ignore_for_file: public_member_api_docs, sort_constructors_first
class BookDate {
  final DateTime bookedDate;
  BookDate({
    required this.bookedDate,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'booked_date': bookedDate,
    };
  }

  factory BookDate.fromJson(Map<String, dynamic> json) {
    return BookDate(
      bookedDate: json['booked_date'],
    );
  }
}
