import 'package:zigba/features/employee/domain/entity/employee_entity.dart';

abstract class EmployeeState {
  const EmployeeState();
}

class InitialState extends EmployeeState {}

class LoadingState extends EmployeeState {}

class SuccessState extends EmployeeState {}

class ErrorState extends EmployeeState {
  final String message;

  const ErrorState({required this.message});
}

class LoadedAllEmployeeState extends EmployeeState {
  final List<EmployeeEntity> employees;

  const LoadedAllEmployeeState({required this.employees});
}
