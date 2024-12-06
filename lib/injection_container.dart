import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:zigba/features/company/domain/usecase/fetch_company_useCase.dart';
import 'package:zigba/features/company/domain/usecase/register_company_useCase.dart';
import 'package:zigba/features/company/presentation/bloc/company_bloc.dart';
import 'package:zigba/features/employee/Data/repository/employee_repository_impl.dart';
import 'package:zigba/features/employee/presentation/bloc/employee_bloc.dart';
import 'features/auth/Data/repository/auth_repository_impl.dart';
import 'features/auth/Data/resource/local_resource.dart';
import 'features/auth/Domain/repository/auth_repository.dart';
import 'features/auth/Domain/useCases/login_usecase.dart';
import 'features/auth/Domain/useCases/signUp_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/company/Data/repository/company_repository_impl.dart';
import 'features/company/Data/resource/company_local_data_source.dart';
import 'features/company/domain/repository/company_repository.dart';
import 'features/employee/Data/resource/employee_local_resource.dart';
import 'features/employee/Domain/repository/employee_repository.dart';
import 'features/employee/Domain/usecase/add_employee.dart';
import 'features/employee/Domain/usecase/get_all_employee.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => AuthBloc(
        sl(), // LoginUseCase
        sl(), // SignUpUseCase
      ));
  sl.registerFactory(() => CompanyBloc(
        sl(),
        sl(),
      ));
  sl.registerFactory(() => EmployeeBloc(
        sl(),
        sl(),
      ));

  // Usecases
  sl.registerLazySingleton(() => SignUpUseCase(sl())); // AuthRepository
  sl.registerLazySingleton(() => LoginUseCase(sl())); // AuthRepository

  sl.registerLazySingleton(() => FetchCompanyUsecase(sl()));
  sl.registerLazySingleton(() => RegisterCompanyUsecase(sl()));

  sl.registerLazySingleton(() => FetchEmployeeUsecase(sl()));
  sl.registerLazySingleton(() => RegisterEmployeeUsecase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        sl(),
      ));

  sl.registerLazySingleton<CompanyRepository>(() => CompanyRepositoryImpl(
        sl(),
      ));

  sl.registerLazySingleton<EmployeeRepository>(() => EmployeeRepositoryImpl(
        sl(),
      ));
  // Data Sources
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<CompanyLocalDataSource>(
      () => CompanyLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<EmployeeLocalDataSource>(
      () => EmployeeLocalDataSourceImpl(sl()));

  // External
  final Box box2 = await Hive.openBox('companyBox');
  // Open the Hive box
  // sl.registerLazySingleton(() => box2); // Register the Box instance

  sl.registerLazySingleton(() => box2); // Register the Box instance
  sl.registerLazySingleton(() => http.Client()); // HTTP Client
}
