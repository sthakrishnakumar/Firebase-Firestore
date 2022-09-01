import 'package:flutter/material.dart';
import 'package:onviro/commons/custom_form_field.dart';
import 'package:onviro/features/users/data/models/post_user_request_model.dart';
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
  bool isLoading = false;

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
    final postUser = ref.watch(postUserNotifierProvider.notifier);
    var sizedBox = const SizedBox(
      height: 10,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Create User'), centerTitle: true),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              CustomFormField(
                controller: nameController,
                labeltext: 'Name',
              ),
              sizedBox,
              CustomFormField(
                controller: jobController,
                labeltext: 'Job',
                textInputAction: TextInputAction.done,
              ),
              sizedBox,
              sizedBox,
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          PostUserRequestModel postUserRequestModel =
                              PostUserRequestModel(
                            name: nameController.text,
                            job: jobController.text,
                          );
                          setState(() {
                            isLoading = true;
                          });
                          await postUser.postUser(
                              postUserRequestModel, context);
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      child: const Text('Create User'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
