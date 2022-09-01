// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../commons/export.dart';

class UserCreatedPage extends ConsumerWidget {
  const UserCreatedPage({
    Key? key,
    required this.id,
    required this.name,
    required this.job,
    required this.createdAt,
  }) : super(key: key);

  final String id;
  final String name;
  final String job;
  final String createdAt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Created Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Your id is $id'),
          Text('Your name is  $name'),
          Text('Your Job is $job'),
          Text('Created Time is $createdAt'),
        ],
      ),
    );
  }
}
