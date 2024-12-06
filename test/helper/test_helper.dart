import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:zigba/features/auth/Data/resource/local_resource.dart';
import 'package:zigba/features/auth/Domain/repository/auth_repository.dart';
import 'package:zigba/features/auth/Domain/useCases/login_usecase.dart';
import 'package:zigba/features/auth/Domain/useCases/signUp_usecase.dart';

@GenerateMocks(
  [
    AuthRepository,
    AuthLocalDataSource,
    SignUpUseCase,
    LoginUseCase,
    Box,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
