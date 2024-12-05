import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:zigba/features/auth/Data/resource/local_resource.dart';
import 'package:zigba/features/auth/Domain/repository/auth_repository.dart';

@GenerateMocks(
  [
    AuthRepository,
    AuthLocalDataSource,
    Box,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
