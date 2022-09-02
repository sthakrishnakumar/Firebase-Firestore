import 'dart:async';

import 'package:flutter/material.dart';

import '../../commons/export.dart';

class BookAppointmentPage extends StatefulWidget {
  const BookAppointmentPage({Key? key}) : super(key: key);

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  bool isLoading = false;
  String user = 'Choose a user';
  List<String> userList = [
    'Mausami Rajbandhari Piya',
    'Amit Yadav Sikhawat',
    'Sukdev Singh Rathore',
  ];

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime? selected;
  String? timeSlot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 10,
          right: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'APPOINTMENT INFORMATION *',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 55,
              decoration: BoxDecoration(
                color: Colors.green[500],
                border: Border.all(
                  color: Colors.grey[200]!,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // const Icon(Icons.gesture),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        hint: Text(
                          user,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        items: userList
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (selectedUser) {
                          setState(() {
                            user = selectedUser.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Appointment Date *',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            IgnorePointer(
              ignoring: user == 'Choose a user' ? true : false,
              child: InkWell(
                onTap: () async {
                  final DateTime? select = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2021),
                    firstDate: DateTime(1964),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Colors.green,
                            onSurface: Colors.red,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  setState(() {
                    selected = select;
                    dateController.text =
                        DateFormat('d MMM y').format(selected!);
                  });
                },
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '   Select a Date for Booking',
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                  enabled: false,
                  controller: dateController,
                  onChanged: (date) {},
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Available Time *',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            selected == null
                ? const SizedBox()
                : Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(2),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...AppConstant.timeSlot1.map(
                              (e) => ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    timeSlot = e;
                                    timeController.text = e;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      timeSlot == e
                                          ? Colors.grey
                                          : Colors.green),
                                ),
                                child: Text(e),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...AppConstant.timeSlot2.map(
                              (e) => ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    timeSlot = e;
                                    timeController.text = e;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      timeSlot == e
                                          ? Colors.grey
                                          : Colors.green),
                                ),
                                child: Text(e),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...AppConstant.timeSlot3.map(
                              (e) => ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    timeSlot = e;
                                    timeController.text = e;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      timeSlot == e
                                          ? Colors.grey
                                          : Colors.green),
                                ),
                                child: Text(e),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...AppConstant.timeSlot4.map(
                              (e) => ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    timeSlot = e;
                                    timeController.text = e;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      timeSlot == e
                                          ? Colors.grey
                                          : Colors.green),
                                ),
                                child: Text(e),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Selected Time',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Please Select Time',
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[300],
              ),
              enabled: false,
              controller: timeController,
              onChanged: (date) {},
            ),
            const SizedBox(
              height: 15,
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (timeSlot == null) {
                          scaffold(
                            context,
                            'Appointment Time is not selected',
                            Colors.red,
                          );
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          BookAppointmentModel appointmentModel =
                              BookAppointmentModel(
                                  name: user,
                                  date: dateController.text,
                                  time: timeSlot!);
                          await bookAppointment(
                              appointmentModel: appointmentModel);
                          // Timer(const Duration(seconds: 2), () {
                          //   scaffold(
                          //     context,
                          //     'Appointment Booked Successfully',
                          //     Colors.green,
                          //   );
                          //   navigation(
                          //     context,
                          //     BookedAppointmentPage(
                          //       timeSlot: timeSlot!,
                          //       date: dateController.text,
                          //       selectedUser: user,
                          //     ),
                          //   );
                          // });
                          Timer(const Duration(seconds: 2), () {
                            setState(() {
                              isLoading = false;
                            });
                          });
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        child: Text('Get Appointed'),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Future bookAppointment(
      {required BookAppointmentModel appointmentModel}) async {
    final pickedDate =
        FirebaseFirestore.instance.collection('appointment-booking').doc();

    final json = appointmentModel.toJson();

    await pickedDate.set(json);
    Timer(
      const Duration(seconds: 2),
      () {
        scaffold(context, 'Appointment Booked Succesfully', Colors.green);
        pushReplacement(context, const BookedAppointmentPage());
      },
    );
  }
}
