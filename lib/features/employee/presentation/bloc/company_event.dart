import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:zigba/features/employee/domain/entity/company_entity.dart';

@immutable
abstract class CompanyEvent extends Equatable {
  const CompanyEvent();

  @override
  List<Object> get props => [];
}

class GetCompanyEvent extends CompanyEvent {
  final String email;

  const GetCompanyEvent(this.email);
  @override
  List<Object> get props => [email];
}

class CreateCompanyEvent extends CompanyEvent {
  final CompanyEntity company;
  final String email;

  const CreateCompanyEvent(this.email, this.company);
  @override
  List<Object> get props => [email, company];
}
