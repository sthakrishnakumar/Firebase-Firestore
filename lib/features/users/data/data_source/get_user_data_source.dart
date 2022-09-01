// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../commons/export.dart';

abstract class GetUserDataSource {
  Future<List<GetUsersModel>> getUsers();
}

class GetUserDataSourceImpl implements GetUserDataSource {
  ApiClient apiClient;
  GetUserDataSourceImpl({
    required this.apiClient,
  });
  @override
  Future<List<GetUsersModel>> getUsers() async {
    final result = await apiClient.request(ApiConstant.users);
    List data = result["data"];
    return data.map((e) => GetUsersModel.fromJson(e)).toList();
  }
}

final getUserDataSourceProvider = Provider<GetUserDataSource>((ref) {
  return GetUserDataSourceImpl(apiClient: ref.watch(apiClientProvider));
});
