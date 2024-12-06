import 'package:dartz/dartz.dart';
import '../../domain/entity/company_entity.dart';
import '../../../../core/error/failure.dart';
import 'package:hive/hive.dart';

import '../models/company_model.dart';

abstract class CompanyLocalDataSource {
  Future<Either<Failure, Unit>> saveCompany(
      String email, CompanyEntity company);
  Future<Either<Failure, CompanyEntity>> getCompany(String email);
}

class CompanyLocalDataSourceImpl implements CompanyLocalDataSource {
  final Box _box;

  CompanyLocalDataSourceImpl(this._box);

  @override
  Future<Either<Failure, Unit>> saveCompany(
      String email, CompanyEntity company) async {
    try {
      final companyModel = CompanyModel.fromEntity(company);
      await _box.put(email, companyModel.toMap());
      return const Right(unit);
    } catch (e) {
      print(e);
      return Left(SaveFailure());
    }
  }

  @override
  Future<Either<Failure, CompanyEntity>> getCompany(String email) async {
    try {
      final data = _box.get(email);
      if (data == null) {
        return Left(NotFoundFailure());
      }
      return Right((data as CompanyModel).toEntity());
    } catch (e) {
      return Left(FetchFailure());
    }
  }
}
