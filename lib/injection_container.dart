import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'features/auth/Data/repository/auth_repository_impl.dart';
import 'features/auth/Data/resource/local_resource.dart';
import 'features/auth/Domain/repository/auth_repository.dart';
import 'features/auth/Domain/useCases/login_usecase.dart';
import 'features/auth/Domain/useCases/signUp_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => AuthBloc(
        sl(), // LoginUseCase
        sl(), // SignUpUseCase
      ));

  // Usecases
  sl.registerLazySingleton(() => SignUpUseCase(sl())); // AuthRepository
  sl.registerLazySingleton(() => LoginUseCase(sl())); // AuthRepository

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        sl(),
      ));

  // Data Sources
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()));

  // External
  final Box box = await Hive.openBox('userBox'); // Open the Hive box
  sl.registerLazySingleton(() => box); // Register the Box instance
  sl.registerLazySingleton(() => http.Client()); // HTTP Client
}
