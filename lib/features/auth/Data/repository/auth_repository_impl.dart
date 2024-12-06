import 'package:dartz/dartz.dart';
import 'package:zigba/features/auth/Domain/entity/user_entity.dart';
import 'package:zigba/features/auth/Domain/repository/auth_repository.dart';

import '../../../../core/error/failure.dart';
import '../model/user_model.dart';
import '../resource/local_resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, Unit>> signUp(User user) async {
    final cur = await localDataSource.saveUser(UserModel.toModel(user));
    return cur;
  }

  @override
  Future<Either<Failure, Unit>> login(User user) async {
    final result = await localDataSource.getUser(user.email);
    return result.fold(
      (failure) => Left(failure), // Pass the failure from the local data source
      (data) {
        if (user.password != data.password) {
          return Left(InvalidPasswordFailure());
        }

        return const Right(unit);
      },
    );
  }
}
