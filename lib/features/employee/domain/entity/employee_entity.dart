class EmployeeEntity {
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String tinNumber;
  final double grossSalary;
  final double taxableEarnings;
  final String startingDate;
  final String method;

  const EmployeeEntity({
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.tinNumber,
    required this.grossSalary,
    required this.taxableEarnings,
    required this.startingDate,
    required this.method,
  });
}
