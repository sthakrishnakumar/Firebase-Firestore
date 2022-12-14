import 'package:flutter/material.dart';
import '../commons/export.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => navigation(
                context,
                const GetUsersPage(),
              ),
              child: const Text('Get Users'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => navigation(
                context,
                const PostUserPage(),
              ),
              child: const Text('Post User'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => navigation(
                context,
                const BookDatePage(),
              ),
              child: const Text('Book Date'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => navigation(
                context,
                const GetDates(),
              ),
              child: const Text('Get Date'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => navigation(
                context,
                const AppointmentPage(),
              ),
              child: const Text(' Appointment'),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
