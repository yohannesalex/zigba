import 'package:dartz/dartz.dart';
import 'package:zigba/features/employee/domain/entity/employee_entity.dart';
import '../../Domain/repository/employee_repository.dart';

import '../../../../core/error/failure.dart';
import '../resource/employee_local_resource.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeLocalDataSource localDataSource;

  EmployeeRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, Unit>> registerEmployee(
      String email, EmployeeEntity employee) async {
    final cur = await localDataSource.saveEmployee(email, employee);
    print(cur);
    return cur;
  }

  @override
  Future<Either<Failure, List<EmployeeEntity>>> fetchAllEmployee(
      String email) async {
    return await localDataSource.getAllEmployees(email);
  }
}
