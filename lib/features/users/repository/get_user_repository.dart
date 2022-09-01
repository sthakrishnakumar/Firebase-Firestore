// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:onviro/core/app_error.dart';
import 'package:onviro/features/users/data/data_source/get_user_data_source.dart';
import 'package:onviro/features/users/data/models/get_user_request_model.dart';

abstract class GetUserRepository {
  Future<Either<AppError, List<GetUsersModel>>> getUsers();
}

class GetUserRepositoryImpl implements GetUserRepository {
  GetUserDataSource getUserDataSource;
  GetUserRepositoryImpl({
    required this.getUserDataSource,
  });

  @override
  Future<Either<AppError, List<GetUsersModel>>> getUsers() async {
    try {
      final result = await getUserDataSource.getUsers();
      return right(result);
    } on DioError catch (e) {
      return Left(
        AppError(message: e.message),
      );
    }
  }
}

final getUserRepoProvider = Provider<GetUserRepository>((ref) {
  return GetUserRepositoryImpl(
      getUserDataSource: ref.watch(getUserDataSourceProvider));
});
