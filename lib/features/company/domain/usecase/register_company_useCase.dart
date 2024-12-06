import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:zigba/features/company/domain/entity/company_entity.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/company_repository.dart';

class RegisterCompanyUsecase implements UseCase<void, RegisterCompanyParams> {
  final CompanyRepository companyRepository;
  RegisterCompanyUsecase(this.companyRepository);

  @override
  Future<Either<Failure, void>> call(RegisterCompanyParams addparams) async {
    final cur = await companyRepository.registerCompany(
        addparams.email, addparams.company);
    print(cur);
    return cur;
  }
}

class RegisterCompanyParams extends Equatable {
  final String email;
  final CompanyEntity company;

  const RegisterCompanyParams({required this.email, required this.company});
  @override
  List<Object?> get props => [email, company];
}
