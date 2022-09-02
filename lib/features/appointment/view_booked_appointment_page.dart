import 'package:flutter/material.dart';

import '../../commons/export.dart';

class BookedAppointmentPage extends StatelessWidget {
  const BookedAppointmentPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream<List<BookAppointmentModel>> getDates() => FirebaseFirestore.instance
        .collection('appointment-booking')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((e) => BookAppointmentModel.fromJson(e.data()))
            .toList());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked Appointment'),
      ),
      body: StreamBuilder<List<BookAppointmentModel>>(
        stream: getDates(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ...snapshot.data!.map(
                  (e) => Card(
                    child: ListTile(
                      title: Text(
                        e.name,
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text('Time : ${e.time}  Date : ${e.date}'),
                      ),
                    ),
                  ),
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

      //  Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       // Card(
      //       //   child: ListTile(
      //       //     title: Text(
      //       //       selectedUser,
      //       //       style: const TextStyle(fontSize: 18),
      //       //     ),
      //       //     subtitle: Padding(
      //       //       padding: const EdgeInsets.only(top: 5),
      //       //       child: Text('Time : $timeSlot  Date : $date'),
      //       //     ),
      //       //   ),
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }
}
