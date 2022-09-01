// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:onviro/core/api_client.dart';
import 'package:onviro/core/api_constant.dart';
import 'package:onviro/features/users/data/models/get_user_request_model.dart';

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
