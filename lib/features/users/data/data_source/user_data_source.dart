// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../commons/export.dart';

abstract class UserDataSource {
  Future<List<GetUsersModel>> getUsers();
  Future<PostUserResponseModel> postUser(
      PostUserRequestModel postUserRequestModel);
}

class UserDataSourceImpl implements UserDataSource {
  ApiClient apiClient;
  UserDataSourceImpl({
    required this.apiClient,
  });
  @override
  Future<List<GetUsersModel>> getUsers() async {
    final result = await apiClient.request(ApiConstant.users);
    List data = result["data"];
    return data.map((e) => GetUsersModel.fromJson(e)).toList();
  }

  @override
  Future<PostUserResponseModel> postUser(
      PostUserRequestModel postUserRequestModel) async {
    final result = await apiClient.request(ApiConstant.users,
        type: 'post', data: postUserRequestModel.toJson());
    return PostUserResponseModel.fromJson(result);
  }
}

final userDataSourceProvider = Provider<UserDataSource>((ref) {
  return UserDataSourceImpl(apiClient: ref.watch(apiClientProvider));
});
