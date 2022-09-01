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
        children: const [
          Text('Hello'),
        ],
      ),
    );
  }
}
