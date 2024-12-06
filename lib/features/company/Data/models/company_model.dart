import 'package:hive/hive.dart';
import '../../domain/entity/company_entity.dart';

@HiveType(typeId: 1) // Ensure typeId is unique
class CompanyModel extends CompanyEntity {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String address;

  @HiveField(2)
  final String phoneNumber;

  @HiveField(3)
  final String tinNumber;

  @HiveField(4)
  final int numberOfEmployees;

  @HiveField(5)
  final String bankName;

  @HiveField(6)
  final String bankAccountNumber;

  const CompanyModel({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.tinNumber,
    required this.numberOfEmployees,
    required this.bankName,
    required this.bankAccountNumber,
  }) : super(
          name: name,
          address: address,
          phoneNumber: phoneNumber,
          tinNumber: tinNumber,
          numberOfEmployees: numberOfEmployees,
          bankName: bankName,
          bankAccountNumber: bankAccountNumber,
        );

  factory CompanyModel.fromEntity(CompanyEntity entity) {
    final cur = CompanyModel(
      name: entity.name,
      address: entity.address,
      phoneNumber: entity.phoneNumber,
      tinNumber: entity.tinNumber,
      numberOfEmployees: entity.numberOfEmployees,
      bankName: entity.bankName,
      bankAccountNumber: entity.bankAccountNumber,
    );
    return cur;
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'tinNumber': tinNumber,
      'numberOfEmployees': numberOfEmployees,
      'bankName': bankName,
      'bankAccountNumber': bankAccountNumber,
    };
  }

  static CompanyModel toModel(Map data) {
    return CompanyModel(
      name: data['name'],
      address: data['address'],
      phoneNumber: data['phoneNumber'],
      tinNumber: data['tinNumber'],
      numberOfEmployees: data['numberOfEmployees'],
      bankName: data['bankName'],
      bankAccountNumber: data['bankAccountNumber'],
    );
  }

  CompanyEntity toEntity() {
    return CompanyEntity(
      name: name,
      address: address,
      phoneNumber: phoneNumber,
      tinNumber: tinNumber,
      numberOfEmployees: numberOfEmployees,
      bankName: bankName,
      bankAccountNumber: bankAccountNumber,
    );
  }
}
