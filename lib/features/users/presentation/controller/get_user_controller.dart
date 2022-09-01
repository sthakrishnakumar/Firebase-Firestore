import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onviro/features/users/data/models/get_user_request_model.dart';
import 'package:onviro/features/users/repository/get_user_repository.dart';

class GetUserNotifier extends StateNotifier<AsyncValue<List<GetUsersModel>>> {
  GetUserNotifier(this.getUserRepository) : super(const AsyncValue.loading()) {
    getUsers();
  }
  GetUserRepository getUserRepository;
  getUsers() async {
    final result = await getUserRepository.getUsers();

    result.fold(
      (l) => state = AsyncValue.error(l.message),
      (r) => state = AsyncValue.data(r),
    );
  }
}

final getUserNotifierProvider =
    StateNotifierProvider<GetUserNotifier, AsyncValue<List<GetUsersModel>>>(
        (ref) {
  return GetUserNotifier(ref.watch(getUserRepoProvider));
});
