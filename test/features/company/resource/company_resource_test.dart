import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';
import 'package:zigba/core/error/failure.dart';
import 'package:zigba/features/company/Data/resource/company_local_data_source.dart';
import 'package:zigba/features/company/data/models/company_model.dart';
import 'package:zigba/features/company/domain/entity/company_entity.dart';

import '../../../helper/test_helper.mocks.dart';

@GenerateMocks([Box])
void main() {
  late Box mockBox;
  late CompanyLocalDataSourceImpl dataSource;

  const testEmail = 'manager@example.com';
  const testCompanyEntity = CompanyEntity(
    name: 'Tech Corp',
    address: '456 Tech Street',
    phoneNumber: '123-456-7890',
    tinNumber: 'TIN67890',
    numberOfEmployees: 100,
    bankName: 'Tech Bank',
    bankAccountNumber: '123456789',
  );

  const testCompanyModel = CompanyModel(
    name: 'Tech Corp',
    address: '456 Tech Street',
    phoneNumber: '123-456-7890',
    tinNumber: 'TIN67890',
    numberOfEmployees: 100,
    bankName: 'Tech Bank',
    bankAccountNumber: '123456789',
  );

  setUp(() {
    mockBox = MockBox();
    dataSource = CompanyLocalDataSourceImpl(mockBox);
  });

  group('saveCompany', () {
    test('should save company data successfully', () async {
      // Arrange
      when(mockBox.put(testEmail, any)).thenAnswer((_) async => {});

      // Act
      final result = await dataSource.saveCompany(testEmail, testCompanyEntity);

      // Assert
      expect(result, const Right(unit));
      verify(mockBox.put(testEmail, testCompanyModel.toMap()));
      verifyNoMoreInteractions(mockBox);
    });

    test('should return SaveFailure on exception', () async {
      // Arrange
      when(mockBox.put(any, any)).thenThrow(Exception());

      // Act
      await dataSource.saveCompany(testEmail, testCompanyEntity);

      // Assert
      verify(mockBox.put(testEmail, testCompanyModel.toMap()));
      verifyNoMoreInteractions(mockBox);
    });
  });

  group('getCompany', () {
    test('should return CompanyEntity when data exists', () async {
      // Arrange
      when(mockBox.get(testEmail)).thenReturn(testCompanyModel.toMap());

      // Act
      await dataSource.getCompany(testEmail);

      // Assert
      verify(mockBox.get(testEmail));
      verifyNoMoreInteractions(mockBox);
    });

    test('should return NotFoundFailure when no data exists', () async {
      // Arrange
      when(mockBox.get(testEmail)).thenReturn(null);

      await dataSource.getCompany(testEmail);

      // Assert
      verify(mockBox.get(testEmail));
      verifyNoMoreInteractions(mockBox);
    });

    test('should return FetchFailure on exception', () async {
      // Arrange
      when(mockBox.get(any)).thenThrow(Exception());

      // Act
      await dataSource.getCompany(testEmail);

      // Assert
      verify(mockBox.get(testEmail));
      verifyNoMoreInteractions(mockBox);
    });
  });
}
