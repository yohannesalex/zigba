import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigba/features/company/presentation/pages/profile.dart';
import 'package:zigba/features/employee/domain/entity/employee_entity.dart';
import 'package:zigba/features/employee/presentation/bloc/employee_bloc.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_event.dart';
import '../../../company/presentation/pages/home.dart';
import '../bloc/employee_state.dart';
import 'add_employee.dart';

class Management extends StatefulWidget {
  final String email;
  Management({Key? key, required this.email}) : super(key: key);

  @override
  State<Management> createState() => _ManagementState();
}

class _ManagementState extends State<Management> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Management',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmployeeRegistration(
                        email: widget.email,
                      ),
                    ),
                    (route) => false,
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 80, 243, 85),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.add_circle_outline,
                          size: 13, color: Color.fromARGB(255, 252, 250, 250)),
                      SizedBox(width: 8),
                      Text(
                        'Add Employee',
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedAllEmployeeState) {
            final employees = state.employees;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.file_upload_outlined,
                        color: Colors.grey),
                    label: const Text(
                      'Upload CSV',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 20,
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue.shade50),
                        columns: const [
                          DataColumn(label: Text('Employees')),
                          DataColumn(label: Text('Net Salary')),
                          DataColumn(label: Text('Taxable Earnings')),
                          DataColumn(label: Text('Income Tax')),
                          DataColumn(label: Text('Pension Tax')),
                          DataColumn(label: Text('Gas Pay')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: _buildDataRows(employees),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('No employees found'),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            context.read<CompanyBloc>().add(GetCompanyEvent(widget.email));
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  email: widget.email,
                ),
              ),
              (route) => false,
            );
          } else if (index == 2) {
            context.read<CompanyBloc>().add(GetCompanyEvent(widget.email));
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Profile(
                  email: widget.email,
                ),
              ),
              (route) => false,
            );
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  if (_currentIndex == 0)
                    Container(
                      height: 3,
                      width: 20,
                      color: Colors.blue,
                    ),
                  const Icon(Icons.home),
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  if (_currentIndex == 1)
                    Container(
                      height: 3,
                      width: 20,
                      color: Colors.blue,
                    ),
                  const Icon(Icons.calendar_today),
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  if (_currentIndex == 2)
                    Container(
                      height: 3,
                      width: 20,
                      color: Colors.blue,
                    ),
                  const Icon(Icons.person),
                ],
              ),
              label: ''),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  List<DataRow> _buildDataRows(List<EmployeeEntity> employees) {
    return employees.map((employee) {
      return DataRow(
        cells: [
          _buildColoredCell(employee.name, 0),
          _buildColoredCell(employee.grossSalary.toString(), 1),
          _buildColoredCell(employee.taxableEarnings.toString(), 2),
          _buildColoredCell(((employee.grossSalary) / 5).toString(), 3),
          _buildColoredCell(((employee.grossSalary) / 9).toString(), 4),
          _buildColoredCell(((employee.grossSalary) / 15).toString(), 5),
          DataCell(
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Pay', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      );
    }).toList();
  }

  DataCell _buildColoredCell(String value, int columnIndex) {
    Color backgroundColor = columnIndex % 2 == 0
        ? Colors.blue.shade50
        : const Color.fromARGB(255, 244, 240, 240);

    return DataCell(
      Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Colors.grey.shade300),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(13),
        child: Text(value),
      ),
    );
  }
}
