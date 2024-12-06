import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigba/features/company/presentation/pages/home.dart';
import 'package:zigba/features/employee/presentation/pages/management.dart';

import '../bloc/company_bloc.dart';
import '../bloc/company_event.dart';
import '../bloc/company_state.dart';

class Profile extends StatefulWidget {
  final String email;

  Profile({Key? key, required this.email}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int employeeNumber = 0;

  int _currentIndex = 2;
  String companyEmail = '';
  String phoneNumber = '';
  String address = '';
  String tinNumber = '';
  String bank = '';
  String companyName = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<CompanyBloc, CompanyState>(
      listener: (context, state) {
        if (state is LoadedCompanyState) {
          setState(() {
            employeeNumber = state.company.numberOfEmployees;
            companyName = state.company.name;
            address = state.company.address;
            tinNumber = state.company.tinNumber;
            bank = state.company.bankName;
            phoneNumber = state.company.phoneNumber;
            companyEmail = widget.email;
          });
        } else {
          print('error');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Company Profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.grey,
                    size: 30,
                  ),
                  onPressed: () {
                    // Handle settings action
                  },
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.blue,
                        child: Image.asset('assets/images/image.png')),
                  ),
                  const Positioned(
                    bottom: 5,
                    right: 5,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.edit, size: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                companyName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'HR Manager',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              _buildInfoItem('Company email', companyEmail, Icons.email),
              const SizedBox(height: 16),
              _buildInfoItem(
                'Phone Number',
                phoneNumber,
                Icons.phone,
              ),
              const SizedBox(height: 16),
              _buildInfoItem('Company Address', address, Icons.location_pin),
              const SizedBox(height: 16),
              _buildInfoItem(
                'Number of Employees',
                employeeNumber.toString(),
                Icons.people_alt_outlined,
              ),
              const SizedBox(height: 16),
              _buildInfoItem(
                'Tin Nummber',
                tinNumber,
                Icons.numbers_outlined,
              ),
              const SizedBox(height: 16),
              _buildInfoItem(
                'Company Bank',
                bank,
                Icons.house_outlined,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, // Set the current index
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Update the current index
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
            } else if (index == 1) {
              context.read<CompanyBloc>().add(GetCompanyEvent(widget.email));
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Management(
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
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(icon, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
