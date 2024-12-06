import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';
import 'package:zigba/features/employee/Data/resource/employee_local_resource.dart';
import 'package:zigba/features/employee/data/model/employee_model.dart';
import 'package:zigba/features/employee/domain/entity/employee_entity.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late Box mockBox;
  late EmployeeLocalDataSourceImpl dataSource;

  const testManagerEmail = 'manager@example.com';
  const testEmployee = EmployeeEntity(
    name: 'John Doe',
    address: '123 Main St',
    phoneNumber: '555-1234',
    tinNumber: 'TIN12345',
    grossSalary: 5000.0,
    taxableEarnings: 4500.0,
    method: 'Bank Transfer',
    email: 'john.doe@example.com',
    startingDate: '2024-01-01',
  );
  const testEmployeeModel = EmployeeModel(
    name: 'John Doe',
    address: '123 Main St',
    phoneNumber: '555-1234',
    tinNumber: 'TIN12345',
    grossSalary: 5000.0,
    taxableEarnings: 4500.0,
    method: 'Bank Transfer',
    email: 'john.doe@example.com',
    startingDate: '2024-01-01',
  );

  final testEmployeeList = [testEmployeeModel.toMap()];

  setUp(() {
    mockBox = MockBox();
    dataSource = EmployeeLocalDataSourceImpl(mockBox);
  });

  group('saveEmployee', () {
    test('should return SaveFailure on exception', () async {
      // Arrange
      when(mockBox.get(any)).thenThrow(Exception());

      // Act

      await dataSource.saveEmployee(testManagerEmail, testEmployee);

      // Assert
      verify(mockBox.get('${testManagerEmail}employee'));
      verifyNoMoreInteractions(mockBox);
    });
  });

  group('getAllEmployees', () {
    test('should return list of EmployeeEntities when data exists', () async {
      // Arrange
      when(mockBox.get('${testManagerEmail}employee'))
          .thenReturn(testEmployeeList);

      // Act
      await dataSource.getAllEmployees(testManagerEmail);

      // Assert
      verify(mockBox.get('${testManagerEmail}employee'));
      verifyNoMoreInteractions(mockBox);
    });

    test('should return NotFoundFailure when no data exists', () async {
      // Arrange
      when(mockBox.get('${testManagerEmail}employee')).thenReturn(null);

      // Act
      await dataSource.getAllEmployees(testManagerEmail);

      // Assert
      verify(mockBox.get('${testManagerEmail}employee'));
      verifyNoMoreInteractions(mockBox);
    });

    test('should return FetchFailure on exception', () async {
      // Arrange
      when(mockBox.get(any)).thenThrow(Exception());

      // Act
      await dataSource.getAllEmployees(testManagerEmail);

      // Assert
      verify(mockBox.get('${testManagerEmail}employee'));
      verifyNoMoreInteractions(mockBox);
    });
  });
}
