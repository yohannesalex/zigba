import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';
import 'package:zigba/core/error/failure.dart';
import 'package:zigba/features/auth/Data/model/user_model.dart';
import 'package:zigba/features/auth/Data/resource/local_resource.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockBox mockBox;
  late AuthLocalDataSourceImpl dataSource;

  setUp(() {
    mockBox = MockBox();
    dataSource = AuthLocalDataSourceImpl(mockBox);
  });

  group('saveUser', () {
    final testUser = UserModel(
      email: 'john@example.com',
      password: 'password123',
    );

    test('should return Right(Unit) when user is saved successfully', () async {
      // Arrange
      when(mockBox.containsKey(testUser.email)).thenReturn(false);
      when(mockBox.put(testUser.email, testUser.toMap()))
          .thenAnswer((_) async => Future.value());

      // Act
      final result = await dataSource.saveUser(testUser);

      // Assert
      verify(mockBox.containsKey(testUser.email));
      verify(mockBox.put(testUser.email, testUser.toMap()));
      expect(result, equals(Right(unit)));
    });

    test(
        'should return Left(UserAlreadyExistsFailure) when user already exists',
        () async {
      // Arrange
      when(mockBox.containsKey(testUser.email)).thenReturn(true);

      // Act
      final result = await dataSource.saveUser(testUser);

      // Assert
      verify(mockBox.containsKey(testUser.email));
    });

    test('should return Left(InvalidInputFailure) when an exception is thrown',
        () async {
      // Arrange
      when(mockBox.containsKey(testUser.email)).thenReturn(false);
      when(mockBox.put(testUser.email, testUser.toMap()))
          .thenThrow(Exception());

      // Act
      final result = await dataSource.saveUser(testUser);

      // Assert
      verify(mockBox.containsKey(testUser.email));
      verify(mockBox.put(testUser.email, testUser.toMap()));
    });
  });

  group('getUser', () {
    const testEmail = 'john@example.com';
    const testUserMap = {
      'email': 'john@example.com',
      'password': 'password123',
    };

    test('should return Right(UserModel) when user is found', () async {
      // Arrange
      when(mockBox.get(testEmail)).thenReturn(testUserMap);

      // Act
      final result = await dataSource.getUser(testEmail);

      // Assert
      verify(mockBox.get(testEmail));
      expect(result, equals(Right(UserModel.fromMap(testUserMap))));
    });

    test('should return Left(UserNotFoundFailure) when user is not found',
        () async {
      // Arrange
      when(mockBox.get(testEmail)).thenReturn(null);

      // Act
      final result = await dataSource.getUser(testEmail);

      // Assert
      verify(mockBox.get(testEmail));
    });
  });
}
