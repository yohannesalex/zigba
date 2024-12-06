import 'package:dartz/dartz.dart';
import '../../domain/entity/company_entity.dart';
import '../../domain/repository/company_repository.dart';
import '../../../../core/error/failure.dart';
import '../resource/company_local_data_source.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyLocalDataSource localDataSource;

  CompanyRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, Unit>> registerCompany(
      String email, CompanyEntity company) async {
    final cur = await localDataSource.saveCompany(email, company);
    print(cur);
    return cur;
  }

  @override
  Future<Either<Failure, CompanyEntity>> fetchCompany(String email) async {
    return await localDataSource.getCompany(email);
  }
}
