import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:zigba/features/employee/Domain/repository/employee_repository.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import 'package:zigba/features/employee/domain/entity/employee_entity.dart';

class RegisterEmployeeUsecase implements UseCase<void, RegisterEmployeeParams> {
  final EmployeeRepository employeeRepository;
  RegisterEmployeeUsecase(this.employeeRepository);

  @override
  Future<Either<Failure, void>> call(RegisterEmployeeParams addparams) async {
    final cur = await employeeRepository.registerEmployee(
        addparams.email, addparams.employee);
    return cur;
  }
}

class RegisterEmployeeParams extends Equatable {
  final String email;
  final EmployeeEntity employee;

  const RegisterEmployeeParams({required this.email, required this.employee});
  @override
  List<Object?> get props => [email, employee];
}
