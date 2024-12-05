import 'package:dartz/dartz.dart';
import 'package:zigba/features/auth/Domain/entity/user_entity.dart';

import '../../../../core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> login(User user);
  Future<Either<Failure, void>> signUp(User user);
}
