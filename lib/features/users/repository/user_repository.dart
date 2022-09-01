// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:onviro/features/users/data/models/post_user_request_model.dart';
import 'package:onviro/features/users/data/models/post_user_response_model.dart';

import '../../../commons/export.dart';

abstract class UserRepository {
  Future<Either<AppError, List<GetUsersModel>>> getUsers();

  Future<Either<AppError, PostUserResponseModel>> postUser(
      PostUserRequestModel postUserRequestModel);
}

class UserRepositoryImpl implements UserRepository {
  UserDataSource userDataSource;
  UserRepositoryImpl({
    required this.userDataSource,
  });

  @override
  Future<Either<AppError, List<GetUsersModel>>> getUsers() async {
    try {
      final result = await userDataSource.getUsers();
      return right(result);
    } on DioError catch (e) {
      return Left(
        AppError(message: e.message),
      );
    }
  }

  @override
  Future<Either<AppError, PostUserResponseModel>> postUser(
      PostUserRequestModel postUserRequestModel) async {
    try {
      final result = await userDataSource.postUser(postUserRequestModel);
      return Right(result);
    } on DioError catch (e) {
      return Left(
        AppError(message: e.message),
      );
    }
  }
}

final userRepoProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(
    userDataSource: ref.watch(userDataSourceProvider),
  );
});
