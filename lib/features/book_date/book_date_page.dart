import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../commons/export.dart';

class BookDatePage extends ConsumerStatefulWidget {
  const BookDatePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookDatePageState();
}

class _BookDatePageState extends ConsumerState<BookDatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Date Page'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Book a Date',
            style: TextStyle(fontSize: 20),
          ),
          CalendarDatePicker(
            initialDate: DateTime(2012),
            firstDate: DateTime(1970),
            lastDate: DateTime.now(),
            onDateChanged: (date) {
              bookDate(date: date);
              log(date.toString());
            },
          ),
        ],
      ),
    );
  }

  Future bookDate({required DateTime date}) async {
    final pickedDate =
        FirebaseFirestore.instance.collection('date booking').doc('my-id');

    final json = {
      'appointment': DateTime(2022, 08, 22),
    };

    await pickedDate.set(json);
  }
}
