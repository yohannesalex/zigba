import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zigba/core/error/failure.dart';
import 'package:zigba/features/auth/Data/repository/auth_repository_impl.dart';
import 'package:zigba/features/auth/Domain/entity/user_entity.dart';
import 'package:zigba/features/auth/Data/model/user_model.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockAuthLocalDataSource mockLocalDataSource;
  late AuthRepositoryImpl authRepository;

  setUp(() {
    mockLocalDataSource = MockAuthLocalDataSource();
    authRepository = AuthRepositoryImpl(mockLocalDataSource);
  });

  group('signUp', () {
    final testUser = User(
      email: 'john@example.com',
      password: 'password123',
    );

    test('should return Right(Unit) when user is saved successfully', () async {
      // Arrange
      when(mockLocalDataSource.saveUser(UserModel.toModel(testUser)))
          .thenAnswer((_) async => Right(unit));

      // Act
      final result = await authRepository.signUp(testUser);

      // Assert
      verify(mockLocalDataSource.saveUser(UserModel.toModel(testUser)));
      expect(result, equals(Right(unit)));
    });

    test('should return failure when saving the user fails', () async {
      // Arrange
      when(mockLocalDataSource.saveUser(UserModel.toModel(testUser)))
          .thenAnswer((_) async => Left(InvalidInputFailure()));

      // Act
      await authRepository.signUp(testUser);

      // Assert
      verify(mockLocalDataSource.saveUser(UserModel.toModel(testUser)));
    });
  });

  group('login', () {
    final testUser = User(
      email: 'john@example.com',
      password: 'password123',
    );
    final storedUser = UserModel(
      email: 'john@example.com',
      password: 'password123',
    );

    test('should return Right(Unit) when login is successful', () async {
      // Arrange
      when(mockLocalDataSource.getUser(testUser.email))
          .thenAnswer((_) async => Right(storedUser));

      // Act
      final result = await authRepository.login(testUser);

      // Assert
      verify(mockLocalDataSource.getUser(testUser.email));
      expect(result, equals(Right(unit)));
    });

    test(
        'should return Left(InvalidPasswordFailure) when passwords do not match',
        () async {
      // Arrange
      final incorrectUser = User(
        email: 'john@example.com',
        password: 'wrongPassword',
      );
      when(mockLocalDataSource.getUser(testUser.email))
          .thenAnswer((_) async => Right(storedUser));

      // Act
      await authRepository.login(incorrectUser);

      // Assert
      verify(mockLocalDataSource.getUser(testUser.email));
    });

    test('should return failure when the user is not found', () async {
      // Arrange
      when(mockLocalDataSource.getUser(testUser.email))
          .thenAnswer((_) async => Left(UserNotFoundFailure()));

      // Act
      await authRepository.login(testUser);

      // Assert
      verify(mockLocalDataSource.getUser(testUser.email));
    });
  });
}
