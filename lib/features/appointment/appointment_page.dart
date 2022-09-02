import 'package:flutter/material.dart';
import 'package:onviro/commons/commons.dart';
import 'package:onviro/features/appointment/book_appointment_page.dart';
import 'package:onviro/features/appointment/view_booked_appointment_page.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                navigation(
                  context,
                  const BookAppointmentPage(),
                );
              },
              child: const Text('Book Appointment'),
            ),
            ElevatedButton(
              onPressed: () {
                navigation(
                  context,
                  const BookedAppointmentPage(),
                );
              },
              child: const Text('View Booked Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
