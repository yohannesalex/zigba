import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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
      when(mockBox.containsKey('${testUser.email}auth')).thenReturn(false);
      when(mockBox.put('${testUser.email}auth', testUser.toMap()))
          .thenAnswer((_) async => Future.value());

      // Act
      final result = await dataSource.saveUser(testUser);

      // Assert
      verify(mockBox.containsKey('${testUser.email}auth'));
      verify(mockBox.put('${testUser.email}auth', testUser.toMap()));
      expect(result, equals(Right(unit)));
    });

    test(
        'should return Left(UserAlreadyExistsFailure) when user already exists',
        () async {
      // Arrange
      when(mockBox.containsKey('${testUser.email}auth')).thenReturn(true);

      // Act
      await dataSource.saveUser(testUser);

      // Assert
      verify(mockBox.containsKey('${testUser.email}auth'));
    });

    test('should return Left(InvalidInputFailure) when an exception is thrown',
        () async {
      // Arrange
      when(mockBox.containsKey('${testUser.email}auth')).thenReturn(false);
      when(mockBox.put('${testUser.email}auth', testUser.toMap()))
          .thenThrow(Exception());

      // Act
      await dataSource.saveUser(testUser);

      // Assert
      verify(mockBox.containsKey('${testUser.email}auth'));
      verify(mockBox.put('${testUser.email}auth', testUser.toMap()));
    });
  });
}
