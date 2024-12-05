import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import '../../../../core/error/failure.dart';
import '../model/user_model.dart';

abstract class AuthLocalDataSource {
  Future<Either<Failure, Unit>> saveUser(UserModel user);
  Future<Either<Failure, UserModel>> getUser(String email);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box _box;

  AuthLocalDataSourceImpl(this._box);

  @override
  Future<Either<Failure, Unit>> saveUser(UserModel user) async {
    if (_box.containsKey(user.email)) {
      return Left(UserAlreadyExistsFailure());
    }

    try {
      await _box.put(user.email, user.toMap());
      return Right(unit);
    } catch (e) {
      return Left(InvalidInputFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser(String email) async {
    final data = _box.get(email);
    if (data == null) {
      return Left(UserNotFoundFailure());
    }

    try {
      final user = UserModel.fromMap(Map<String, dynamic>.from(data));
      return Right(user);
    } catch (e) {
      return Left(InvalidInputFailure());
    }
  }
}
