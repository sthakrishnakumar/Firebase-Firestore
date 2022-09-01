import 'package:flutter/material.dart';
import 'package:onviro/features/users/presentation/controller/post_user_controller.dart';

import '../../../../commons/export.dart';

class PostUserPage extends ConsumerStatefulWidget {
  const PostUserPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostUserPageState();
}

class _PostUserPageState extends ConsumerState<PostUserPage> {
  late TextEditingController nameController;
  late TextEditingController jobController;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController();
    jobController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postUser = ref.watch(postUserNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
            ),
            TextFormField(
              controller: jobController,
            ),
          ],
        ),
      ),
    );
  }
}
