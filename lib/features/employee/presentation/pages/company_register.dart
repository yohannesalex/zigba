import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigba/features/employee/domain/entity/company_entity.dart';

import '../bloc/company_bloc.dart';
import '../bloc/company_event.dart';
import '../bloc/company_state.dart';

class CompanyRegistration extends StatefulWidget {
  final String email;
  CompanyRegistration({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<CompanyRegistration> createState() => _CompanyRegistrationState();
}

class _CompanyRegistrationState extends State<CompanyRegistration> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _addressController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _tinNumberController = TextEditingController();

  final _numberOfEmployeesController = TextEditingController();

  final _companyBankController = TextEditingController();

  final _bankAccountNumberController = TextEditingController();

  String get email => widget.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocListener<CompanyBloc, CompanyState>(
        listener: (context, state) {
          if (state is SuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Company registered successfully'),
              ),
            );
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  'Register your company',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text(
                      'to',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const Text(
                      ' Demoz Payroll',
                      style: TextStyle(fontSize: 24, color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  'Register your company to continue',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                _buildTextField('Company name'),
                _buildTextField('Address of the company'),
                _buildTextField('Phone Number',
                    keyboardType: TextInputType.phone),
                _buildTextField('Tin Number'),
                _buildTextField('Number of employees',
                    keyboardType: TextInputType.number),
                _buildTextField('Company bank'),
                _buildTextField('Bank account number',
                    keyboardType: TextInputType.number),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<CompanyBloc>().add(CreateCompanyEvent(
                          email,
                          CompanyEntity(
                            name: _nameController.text,
                            address: _addressController.text,
                            phoneNumber: _phoneNumberController.text,
                            tinNumber: _tinNumberController.text,
                            numberOfEmployees:
                                int.parse(_numberOfEmployeesController.text),
                            bankName: _companyBankController.text,
                            bankAccountNumber:
                                _bankAccountNumberController.text,
                          )));
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 251, 249, 249),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Submit for approval'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
