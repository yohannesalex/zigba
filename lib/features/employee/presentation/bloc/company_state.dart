import 'package:zigba/features/employee/domain/entity/company_entity.dart';

abstract class CompanyState {
  const CompanyState();
}

class InitialState extends CompanyState {}

class LoadingState extends CompanyState {}

class SuccessState extends CompanyState {}

class ErrorState extends CompanyState {
  final String message;

  const ErrorState({required this.message});
}

class LoadedCompanyState extends CompanyState {
  final CompanyEntity company;

  const LoadedCompanyState({required this.company});
}
