import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigba/features/employee/domain/entity/employee_entity.dart';
import 'package:zigba/features/employee/presentation/pages/management.dart';

import '../bloc/employee_bloc.dart';
import '../bloc/employee_event.dart';
import '../bloc/employee_state.dart';

class EmployeeRegistration extends StatefulWidget {
  final String email;
  EmployeeRegistration({Key? key, required this.email}) : super(key: key);
  @override
  _EmployeeRegistrationState createState() => _EmployeeRegistrationState();
}

class _EmployeeRegistrationState extends State<EmployeeRegistration> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each input field
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _tinController = TextEditingController();
  final TextEditingController _grossSalaryController = TextEditingController();
  final TextEditingController _taxableEarningController =
      TextEditingController();
  final TextEditingController _startingDateController = TextEditingController();

  // State variable to track the selected method
  String _selectedMethod = 'per month';

  @override
  void dispose() {
    // Dispose controllers to free up resources when the widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _tinController.dispose();
    _grossSalaryController.dispose();
    _taxableEarningController.dispose();
    _startingDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Management(
                        email: widget.email,
                      ),
                    ),
                    (route) => false,
                  );
                },
              ),
              const Text(
                "Add Employee",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      body: BlocListener<EmployeeBloc, EmployeeState>(
        listener: (context, state) {
          if (state is SuccessState) {
            context.read<EmployeeBloc>().add(
                  GetEmployeeEvent(
                    widget.email,
                  ),
                );

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Management(
                  email: widget.email,
                ),
              ),
              (route) => false,
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Row(
                  children: [
                    Text(
                      'Add New',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      ' Employee',
                      style: TextStyle(fontSize: 24, color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  'Here you add your new employee and start calculating his tax and salary',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                _buildTextField('Employee name', _nameController),
                _buildTextField('Email Address', _emailController),
                _buildTextField('Phone Number', _phoneController,
                    keyboardType: TextInputType.phone),
                _buildTextField('Tin Number', _tinController),
                _buildTextField('Gross Salary', _grossSalaryController,
                    keyboardType: TextInputType.number),
                _buildTextField('Taxable Earning', _taxableEarningController),
                _buildTextField(
                    'Starting Date Of Salary', _startingDateController,
                    keyboardType: TextInputType.number),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildMethodButton('per month'),
                    const SizedBox(width: 8),
                    _buildMethodButton('per Contract'),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print(_selectedMethod);
                      // Handle form submission
                      context.read<EmployeeBloc>().add(
                            CreateEmployeeEvent(
                              widget.email,
                              EmployeeEntity(
                                name: _nameController.text,
                                address: '',
                                phoneNumber: _phoneController.text,
                                tinNumber: _tinController.text,
                                grossSalary:
                                    double.parse(_grossSalaryController.text),
                                taxableEarnings: double.parse(
                                    _taxableEarningController.text),
                                method:
                                    _selectedMethod, // Use the selected method here
                                email: _emailController.text,
                                startingDate: _startingDateController.text,
                              ),
                            ),
                          );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 240, 240),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    child: const Text(
                      'Add Employee',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMethodButton(String method) {
    bool isSelected = _selectedMethod == method;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = method;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 133, 177, 239)
              : const Color.fromARGB(255, 200, 200, 200),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
        child: Text(
          method,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
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
          if (label == 'Email Address') {
            // Validate email format
            String pattern = r'^[^@]+@[^@]+\.[^@]+$';
            RegExp regex = RegExp(pattern);
            if (!regex.hasMatch(value)) {
              return 'Please enter a valid email address';
            }
          }
          if (label == 'Phone Number') {
            // Validate phone number (e.g., allow only digits, min/max length)
            if (!RegExp(r'^\d+$').hasMatch(value)) {
              return 'Phone number must contain only digits';
            }
            if (value.length < 10 || value.length > 15) {
              return 'Phone number should be between 10 to 15 digits';
            }
          }
          if (label == 'Gross Salary' || label == 'Taxable Earning') {
            // Ensure numeric fields only accept numbers
            if (double.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
          }
          return null;
        },
      ),
    );
  }
}
