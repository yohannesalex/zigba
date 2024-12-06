import 'package:dartz/dartz.dart';
import 'package:zigba/features/employee/domain/entity/employee_entity.dart';
import '../../../../core/error/failure.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, Unit>> registerEmployee(
      String email, EmployeeEntity employee);
  Future<Either<Failure, List<EmployeeEntity>>> fetchAllEmployee(String email);
}
