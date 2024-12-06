import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigba/features/employee/domain/entity/company_entity.dart';
import 'package:zigba/features/employee/presentation/pages/home.dart';
import '../bloc/company_bloc.dart';
import '../bloc/company_event.dart';
import '../bloc/company_state.dart';

class CompanyRegistration extends StatefulWidget {
  final String email;
  CompanyRegistration({Key? key, required this.email}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocListener<CompanyBloc, CompanyState>(
        listener: (context, state) {
          if (state is SuccessState) {
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
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
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
                  children: const [
                    Text('to', style: TextStyle(fontSize: 24)),
                    Text(
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
                _buildTextField('Company name', controller: _nameController),
                _buildTextField('Address of the company',
                    controller: _addressController),
                _buildTextField(
                  'Phone Number',
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  validator: _validatePhoneNumber,
                ),
                _buildTextField('Tin Number', controller: _tinNumberController),
                _buildTextField(
                  'Number of employees',
                  controller: _numberOfEmployeesController,
                  keyboardType: TextInputType.number,
                  validator: _validateNumber,
                ),
                _buildTextField('Company bank',
                    controller: _companyBankController),
                _buildTextField(
                  'Bank account number',
                  controller: _bankAccountNumberController,
                  keyboardType: TextInputType.number,
                  validator: _validateNumber,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final email = widget.email;
                      print('-----------------$email');
                      context.read<CompanyBloc>().add(
                            CreateCompanyEvent(
                              email,
                              CompanyEntity(
                                name: _nameController.text,
                                address: _addressController.text,
                                phoneNumber: _phoneNumberController.text,
                                tinNumber: _tinNumberController.text,
                                numberOfEmployees: int.parse(
                                    _numberOfEmployeesController.text),
                                bankName: _companyBankController.text,
                                bankAccountNumber:
                                    _bankAccountNumberController.text,
                              ),
                            ),
                          );
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
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label, {
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: validator ?? (value) => _defaultValidator(value, label),
      ),
    );
  }

  String? _defaultValidator(String? value, String label) {
    if (value == null || value.isEmpty) {
      return 'Please enter $label';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Phone Number';
    }
    final phoneRegex = RegExp(r'^\d+$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? _validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }
}
