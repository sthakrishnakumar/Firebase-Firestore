import 'package:dio/dio.dart';
import 'package:onviro/core/api_constant.dart';

class ApiClient {
  request(String endpoint,
      {String type = 'get', Map<String, dynamic> data = const {}}) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
      ),
    );

    try {
      final response = type == 'get'
          ? await dio.get(endpoint)
          : await dio.post(endpoint, data: data);
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
