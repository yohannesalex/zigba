import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:zigba/features/company/domain/entity/company_entity.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/company_repository.dart';

class FetchCompanyUsecase implements UseCase<void, FetchCompanyParams> {
  final CompanyRepository companyRepository;
  FetchCompanyUsecase(this.companyRepository);

  @override
  Future<Either<Failure, CompanyEntity>> call(
      FetchCompanyParams fetchparams) async {
    return await companyRepository.fetchCompany(fetchparams.email);
  }
}

class FetchCompanyParams extends Equatable {
  final String email;

  const FetchCompanyParams({required this.email});
  @override
  List<Object?> get props => [
        email,
      ];
}
