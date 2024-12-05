import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:zigba/features/auth/Domain/entity/user_entity.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';

import '../repository/auth_repository.dart';

class SignUpUseCase implements UseCase<void, SignUpParams> {
  final AuthRepository authRepository;
  SignUpUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(SignUpParams signUpParams) async {
    return await authRepository.signUp(signUpParams.user);
  }
}

class SignUpParams extends Equatable {
  final User user;

  const SignUpParams({required this.user});
  @override
  List<Object?> get props => [user];
}
