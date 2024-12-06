import 'package:dartz/dartz.dart';
import 'package:zigba/features/employee/Data/model/employee_model.dart';
import 'package:zigba/features/employee/domain/entity/employee_entity.dart';
import '../../../../core/error/failure.dart';
import 'package:hive/hive.dart';

abstract class EmployeeLocalDataSource {
  Future<Either<Failure, Unit>> saveEmployee(
      String managerEmail, EmployeeEntity employee);
  Future<Either<Failure, List<EmployeeEntity>>> getAllEmployees(
      String managerEmail);
}

class EmployeeLocalDataSourceImpl implements EmployeeLocalDataSource {
  final Box _box;

  EmployeeLocalDataSourceImpl(this._box);

  @override
  Future<Either<Failure, Unit>> saveEmployee(
      String managerEmail, EmployeeEntity employee) async {
    try {
      final employeeModel = EmployeeModel.fromEntity(employee);

      // Retrieve the existing list or initialize an empty one
      final currentEmployees = _box.get('${managerEmail}employee');
      if (currentEmployees == null) {
        await _box.put('${managerEmail}employee', [employeeModel.toMap()]);
      } else {
        // Add the new employee to the list
        currentEmployees.add(employeeModel.toMap());

        // Save the updated list back to the box
        await _box.put('${managerEmail}employee', currentEmployees);
      }

      return const Right(unit);
    } catch (e) {
      print(e);
      return Left(SaveFailure());
    }
  }

  @override
  Future<Either<Failure, List<EmployeeEntity>>> getAllEmployees(
      String managerEmail) async {
    try {
      // Retrieve the list of employees for the given manager
      final data = _box.get('${managerEmail}employee');
      print('data is $data');
      if (data == null) {
        return Left(NotFoundFailure());
      }

      // Convert the list of maps to EmployeeEntities
      final employees = (data as List)
          .map((employeeData) => EmployeeModel.toModel(employeeData).toEntity())
          .toList();

      return Right(employees);
    } catch (e) {
      print('hey');
      print(e);
      return Left(FetchFailure());
    }
  }
}
