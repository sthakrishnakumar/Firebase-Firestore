import 'package:flutter/material.dart';

import '../../../../commons/export.dart';

class PostUserNotifier
    extends StateNotifier<AsyncValue<PostUserResponseModel>> {
  PostUserNotifier(this.userRepository) : super(const AsyncValue.loading());

  UserRepository userRepository;
  postUser(
      PostUserRequestModel postUserRequestModel, BuildContext context) async {
    final result = await userRepository.postUser(postUserRequestModel);
    result.fold(
      (l) => scaffold(context, l.message, Colors.red),
      (r) {
        navigation(
            context,
            UserCreatedPage(
              id: r.id,
              name: r.name,
              job: r.job,
              createdAt: r.createdAt,
            ));
        return scaffold(
          context,
          'User ${r.id} Created Successfully at ${r.createdAt}',
          Colors.green,
        );
      },
    );
  }
}

final postUserNotifierProvider =
    StateNotifierProvider<PostUserNotifier, AsyncValue<PostUserResponseModel>>(
        (ref) {
  return PostUserNotifier(ref.watch(userRepoProvider));
});
