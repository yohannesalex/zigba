import 'package:hive/hive.dart';

import '../../domain/entity/employee_entity.dart';

@HiveType(typeId: 2) // Ensure typeId is unique
class EmployeeModel extends EmployeeEntity {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String address;

  @HiveField(2)
  final String phoneNumber;

  @HiveField(3)
  final String tinNumber;

  @HiveField(4)
  final double grossSalary;

  @HiveField(5)
  final double taxableEarnings;

  @HiveField(6)
  final String method;

  @HiveField(7)
  final String email;

  @HiveField(8)
  final String startingDate;

  const EmployeeModel({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.tinNumber,
    required this.grossSalary,
    required this.taxableEarnings,
    required this.method,
    required this.email,
    required this.startingDate,
  }) : super(
          name: name,
          address: address,
          phoneNumber: phoneNumber,
          tinNumber: tinNumber,
          grossSalary: grossSalary,
          taxableEarnings: taxableEarnings,
          method: method,
          email: email,
          startingDate: startingDate,
        );

  factory EmployeeModel.fromEntity(EmployeeEntity entity) {
    final cur = EmployeeModel(
      name: entity.name,
      address: entity.address,
      phoneNumber: entity.phoneNumber,
      tinNumber: entity.tinNumber,
      grossSalary: entity.grossSalary,
      taxableEarnings: entity.taxableEarnings,
      method: entity.method,
      email: entity.email,
      startingDate: entity.startingDate,
    );
    return cur;
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'tinNumber': tinNumber,
      'grossSalary': grossSalary,
      'taxableEarnings': taxableEarnings,
      'method': method,
      'email': email,
      'startingDate': startingDate,
    };
  }

  static EmployeeModel toModel(Map data) {
    return EmployeeModel(
      name: data['name'],
      address: data['address'],
      phoneNumber: data['phoneNumber'],
      tinNumber: data['tinNumber'],
      grossSalary: data['grossSalary'],
      taxableEarnings: data['taxableEarnings'],
      method: data['method'],
      email: data['email'],
      startingDate: data['startingDate'],
    );
  }

  EmployeeEntity toEntity() {
    return EmployeeEntity(
      name: name,
      address: address,
      phoneNumber: phoneNumber,
      tinNumber: tinNumber,
      grossSalary: grossSalary,
      taxableEarnings: taxableEarnings,
      method: method,
      email: email,
      startingDate: startingDate,
    );
  }
}
