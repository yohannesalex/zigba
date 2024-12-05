import 'package:flutter/material.dart';

class EmployeeRegistration extends StatefulWidget {
  @override
  _EmployeeRegistrationState createState() => _EmployeeRegistrationState();
}

class _EmployeeRegistrationState extends State<EmployeeRegistration> {
  final _formKey = GlobalKey<FormState>();

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
                  // Handle back button press
                },
              ),
              Text(
                "Add Employee",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Row(
                children: [
                  const Text(
                    'Add New',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const Text(
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
              _buildTextField('Employee name'),
              _buildTextField('Email Adress'),
              _buildTextField('Phone Number',
                  keyboardType: TextInputType.phone),
              _buildTextField('Tin Number'),
              _buildTextField('Gross Salary',
                  keyboardType: TextInputType.number),
              _buildTextField('Taxable Earning'),
              _buildTextField('Starting Date Of Salary',
                  keyboardType: TextInputType.number),
              const SizedBox(height: 30),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 133, 177, 239),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Text('per month'),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 133, 177, 239),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Text('per Contract'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
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
