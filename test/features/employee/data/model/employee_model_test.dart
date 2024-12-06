import 'package:flutter_test/flutter_test.dart';

import 'package:zigba/features/employee/Data/model/employee_model.dart';
import 'package:zigba/features/employee/domain/entity/employee_entity.dart';

void main() {
  group('EmployeeModel Tests', () {
    const testEmployee = EmployeeModel(
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

    test('EmployeeModel toMap returns correct map', () {
      final map = testEmployee.toMap();
      expect(map, {
        'name': 'John Doe',
        'address': '123 Main St',
        'phoneNumber': '555-1234',
        'tinNumber': 'TIN12345',
        'grossSalary': 5000.0,
        'taxableEarnings': 4500.0,
        'method': 'Bank Transfer',
        'email': 'john.doe@example.com',
        'startingDate': '2024-01-01',
      });
    });

    test('EmployeeModel toModel creates correct instance from map', () {
      final map = {
        'name': 'John Doe',
        'address': '123 Main St',
        'phoneNumber': '555-1234',
        'tinNumber': 'TIN12345',
        'grossSalary': 5000.0,
        'taxableEarnings': 4500.0,
        'method': 'Bank Transfer',
        'email': 'john.doe@example.com',
        'startingDate': '2024-01-01',
      };
      final model = EmployeeModel.toModel(map);

      expect(model.name, testEmployee.name);
      expect(model.address, testEmployee.address);
      expect(model.phoneNumber, testEmployee.phoneNumber);
      expect(model.tinNumber, testEmployee.tinNumber);
      expect(model.grossSalary, testEmployee.grossSalary);
      expect(model.taxableEarnings, testEmployee.taxableEarnings);
      expect(model.method, testEmployee.method);
      expect(model.email, testEmployee.email);
      expect(model.startingDate, testEmployee.startingDate);
    });

    test('EmployeeModel.fromEntity creates correct instance', () {
      const entity = EmployeeEntity(
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

      final model = EmployeeModel.fromEntity(entity);

      expect(model.name, testEmployee.name);
      expect(model.address, testEmployee.address);
      expect(model.phoneNumber, testEmployee.phoneNumber);
      expect(model.tinNumber, testEmployee.tinNumber);
      expect(model.grossSalary, testEmployee.grossSalary);
      expect(model.taxableEarnings, testEmployee.taxableEarnings);
      expect(model.method, testEmployee.method);
      expect(model.email, testEmployee.email);
      expect(model.startingDate, testEmployee.startingDate);
    });

    test('EmployeeModel toEntity returns correct entity', () {
      final entity = testEmployee.toEntity();

      expect(entity.name, testEmployee.name);
      expect(entity.address, testEmployee.address);
      expect(entity.phoneNumber, testEmployee.phoneNumber);
      expect(entity.tinNumber, testEmployee.tinNumber);
      expect(entity.grossSalary, testEmployee.grossSalary);
      expect(entity.taxableEarnings, testEmployee.taxableEarnings);
      expect(entity.method, testEmployee.method);
      expect(entity.email, testEmployee.email);
      expect(entity.startingDate, testEmployee.startingDate);
    });
  });
}
