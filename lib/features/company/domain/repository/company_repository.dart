import 'package:dartz/dartz.dart';
import '../entity/company_entity.dart';
import '../../../../core/error/failure.dart';

abstract class CompanyRepository {
  Future<Either<Failure, Unit>> registerCompany(
      String email, CompanyEntity company);
  Future<Either<Failure, CompanyEntity>> fetchCompany(String email);
}
