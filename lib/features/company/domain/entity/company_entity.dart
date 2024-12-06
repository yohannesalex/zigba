class CompanyEntity {
  final String name;
  final String address;
  final String phoneNumber;
  final String tinNumber;
  final int numberOfEmployees;
  final String bankName;
  final String bankAccountNumber;

  const CompanyEntity({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.tinNumber,
    required this.numberOfEmployees,
    required this.bankName,
    required this.bankAccountNumber,
  });
}
