import 'package:flutter/material.dart';
import 'package:onviro/commons/commons.dart';
import 'package:onviro/features/users/presentation/screens/get_users_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
              onPressed: () {},
              child: const Text('Post User'),
            ),
          ],
        ),
      ),
    );
  }
}
