// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../commons/export.dart';

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
