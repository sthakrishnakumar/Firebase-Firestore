import 'package:flutter/material.dart';
import '../../commons/export.dart';

class GetDates extends StatelessWidget {
  const GetDates({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Stream<List<BookDate>> getDates() => FirebaseFirestore.instance
        .collection('date-booking')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((e) => BookDate.fromJson(e.data())).toList());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dates Booked'),
      ),
      body: StreamBuilder<List<BookDate>>(
        stream: getDates(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            
            return Center(
              child: Text('Something went wrong ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return ListView(
              children: [
                ...snapshot.data!.map(
                  (e) => Text(e.bookedDate),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // if (snapshot.hasData) {
          //   final dates = snapshot.data;
          //   return ListView(
          //     children: [...dates.map((e) => Text(e.bookedDate.toString()))],
          //   );
          // }
        }),
      ),
    );
  }
}
