import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'export.dart';

void navigation(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => widget),
  );
}

void pushReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
    context,
    CupertinoPageRoute(builder: (context) => widget),
  );
}

void scaffold(BuildContext context, String content, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: color,
      duration: const Duration(milliseconds: 500),
    ),
  );
}

Stream<List<BookAppointmentModel>> getDates() => FirebaseFirestore.instance
    .collection('appointment-booking')
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((e) => BookAppointmentModel.fromJson(e.data()))
        .toList());

// class Data extends StatelessWidget {
//   Data({Key? key}) : super(key: key);

//   List<BookAppointmentModel> bookedData = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('title'),
//       ),
//       body: StreamBuilder<List<BookAppointmentModel>>(
//           stream: getDates(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text('Something went wrong ${snapshot.error}'),
//               );
//             } else if (snapshot.hasData) {
//               bookedData = snapshot.data!;
//               return const Text('');
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
//     );
//   }
// }
