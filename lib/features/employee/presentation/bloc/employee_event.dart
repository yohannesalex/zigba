import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:zigba/features/company/domain/entity/company_entity.dart';
import 'package:zigba/features/employee/domain/entity/employee_entity.dart';

@immutable
abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class GetEmployeeEvent extends EmployeeEvent {
  final String email;

  const GetEmployeeEvent(this.email);
  @override
  List<Object> get props => [email];
}

class CreateEmployeeEvent extends EmployeeEvent {
  final EmployeeEntity employee;
  final String email;

  const CreateEmployeeEvent(this.email, this.employee);
  @override
  List<Object> get props => [email, employee];
}
