import 'package:flutter_test/flutter_test.dart';
import 'package:zigba/features/company/Data/models/company_model.dart';
import 'package:zigba/features/company/domain/entity/company_entity.dart';

void main() {
  group('CompanyModel Tests', () {
    const testCompany = CompanyModel(
      name: 'Tech Corp',
      address: '456 Tech Street',
      phoneNumber: '123-456-7890',
      tinNumber: 'TIN67890',
      numberOfEmployees: 100,
      bankName: 'Tech Bank',
      bankAccountNumber: '123456789',
    );

    test('toMap should return correct map', () {
      final map = testCompany.toMap();
      expect(map, {
        'name': 'Tech Corp',
        'address': '456 Tech Street',
        'phoneNumber': '123-456-7890',
        'tinNumber': 'TIN67890',
        'numberOfEmployees': 100,
        'bankName': 'Tech Bank',
        'bankAccountNumber': '123456789',
      });
    });

    test('toModel should create correct instance from map', () {
      final map = {
        'name': 'Tech Corp',
        'address': '456 Tech Street',
        'phoneNumber': '123-456-7890',
        'tinNumber': 'TIN67890',
        'numberOfEmployees': 100,
        'bankName': 'Tech Bank',
        'bankAccountNumber': '123456789',
      };
      final model = CompanyModel.toModel(map);

      expect(model.name, testCompany.name);
      expect(model.address, testCompany.address);
      expect(model.phoneNumber, testCompany.phoneNumber);
      expect(model.tinNumber, testCompany.tinNumber);
      expect(model.numberOfEmployees, testCompany.numberOfEmployees);
      expect(model.bankName, testCompany.bankName);
      expect(model.bankAccountNumber, testCompany.bankAccountNumber);
    });

    test('fromEntity should create correct instance from CompanyEntity', () {
      final entity = CompanyEntity(
        name: 'Tech Corp',
        address: '456 Tech Street',
        phoneNumber: '123-456-7890',
        tinNumber: 'TIN67890',
        numberOfEmployees: 100,
        bankName: 'Tech Bank',
        bankAccountNumber: '123456789',
      );
      final model = CompanyModel.fromEntity(entity);

      expect(model.name, testCompany.name);
      expect(model.address, testCompany.address);
      expect(model.phoneNumber, testCompany.phoneNumber);
      expect(model.tinNumber, testCompany.tinNumber);
      expect(model.numberOfEmployees, testCompany.numberOfEmployees);
      expect(model.bankName, testCompany.bankName);
      expect(model.bankAccountNumber, testCompany.bankAccountNumber);
    });

    test('toEntity should return correct CompanyEntity', () {
      final entity = testCompany.toEntity();

      expect(entity.name, testCompany.name);
      expect(entity.address, testCompany.address);
      expect(entity.phoneNumber, testCompany.phoneNumber);
      expect(entity.tinNumber, testCompany.tinNumber);
      expect(entity.numberOfEmployees, testCompany.numberOfEmployees);
      expect(entity.bankName, testCompany.bankName);
      expect(entity.bankAccountNumber, testCompany.bankAccountNumber);
    });
  });
}
