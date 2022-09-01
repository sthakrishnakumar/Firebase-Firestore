import 'dart:async';

import 'package:flutter/material.dart';

import '../../commons/export.dart';

class BookDatePage extends ConsumerStatefulWidget {
  const BookDatePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookDatePageState();
}

class _BookDatePageState extends ConsumerState<BookDatePage> {
  TextEditingController dateController = TextEditingController();
  DateTime? selected;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Date Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Book a Date',
            style: TextStyle(fontSize: 20),
          ),

          InkWell(
            onTap: () async {
              final DateTime? select = await showDatePicker(
                context: context,
                initialDate: DateTime(2021),
                firstDate: DateTime(1964),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(primary: Colors.red
                          // onPrimary: Colors.green,
                          // onSurface: Colors.red,
                          ),
                    ),
                    child: child!,
                  );
                },
                
              );

              setState(() {
                selected = select;
                dateController.text = DateFormat('d MMM y').format(selected!);
              });
            },
            child: TextField(
              decoration: const InputDecoration(
                hintText: '   Select a Date for Booking',
              ),
              enabled: false,
              controller: dateController,
              onChanged: (date) {},
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  onPressed: () async {
                    if (selected != null) {
                      setState(() {
                        isLoading = true;
                      });
                      final date = BookDate(bookedDate: dateController.text);
                      await bookDate(date: date);
                      Timer(const Duration(seconds: 2), () {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    }
                  },
                  child: const Text('Book Appointment'),
                ),
          // const SizedBox(
          //   height: 50,
          // ),

          // CalendarDatePicker(
          //   initialDate: DateTime(2012),
          //   firstDate: DateTime(1970),
          //   lastDate: DateTime.now(),
          //   onDateChanged: (date) {
          //     // bookDate(date: date);
          //     log(date.toString());
          //   },
          // ),
        ],
      ),
    );
  }

  Future bookDate({required BookDate date}) async {
    final pickedDate =
        FirebaseFirestore.instance.collection('date-booking').doc();

    final json = date.toJson();

    await pickedDate.set(json);
    Timer(
      const Duration(seconds: 2),
      () {
        scaffold(context, 'Appointment Booked Succesfully', Colors.green);
      },
    );
  }
}
