import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:zigba/features/company/domain/entity/company_entity.dart';
import 'package:zigba/features/employee/Domain/repository/employee_repository.dart';
import 'package:zigba/features/employee/domain/entity/employee_entity.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/error/failure.dart';

class FetchEmployeeUsecase implements UseCase<void, FetchEmployeeParams> {
  final EmployeeRepository employeeRepository;
  FetchEmployeeUsecase(this.employeeRepository);

  @override
  Future<Either<Failure, List<EmployeeEntity>>> call(
      FetchEmployeeParams fetchparams) async {
    return await employeeRepository.fetchAllEmployee(fetchparams.email);
  }
}

class FetchEmployeeParams extends Equatable {
  final String email;

  const FetchEmployeeParams({required this.email});
  @override
  List<Object?> get props => [
        email,
      ];
}
