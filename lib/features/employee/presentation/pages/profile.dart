import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Company Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.grey),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
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
            const Text(
              'Company Name',
              style: TextStyle(
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
            _buildTextField(
              label: 'Company Email',
              icon: Icons.email,
              hintText: 'xxx@gmail.com',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Phone Number',
              icon: Icons.phone,
              hintText: '+93123135',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Company Address',
              hintText: 'Somewhere',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Number of Employees',
              hintText: '20',
              isNumeric: true,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Tin Nummber',
              hintText: '2345672',
              isNumeric: true,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Company Bank',
              hintText: 'Abyssinia',
              isNumeric: true,
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
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/management');
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

  Widget _buildTextField({
    required String label,
    String? hintText,
    IconData? icon,
    bool isNumeric = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            prefixIcon:
                icon != null ? Icon(icon, size: 20, color: Colors.grey) : null,
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
