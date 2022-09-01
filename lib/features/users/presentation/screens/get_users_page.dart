import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onviro/features/users/presentation/controller/get_user_controller.dart';

class GetUsersPage extends ConsumerStatefulWidget {
  const GetUsersPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GetUsersPageState();
}

class _GetUsersPageState extends ConsumerState<GetUsersPage> {
  @override
  Widget build(BuildContext context) {
    final getUsers = ref.watch(getUserNotifierProvider);
    return Scaffold(
      body: Column(
        children: [
          ListTile(),
        ],
      ),
    );
  }
}
