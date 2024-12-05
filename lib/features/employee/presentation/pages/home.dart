import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isUpcoming = true;
  int _currentIndex = 0;
  void _navigateToPage(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigate to different routes based on index
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/management');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Home',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings_outlined, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Stats Grid
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard('Number of Employees', '20', Colors.blue),
                  _buildStatCard('Income Tax paid', '2000', Colors.green),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard('Pension Tax Paid', '4', Colors.purple),
                  _buildStatCard('Employees Performance', '95 %', Colors.red),
                ],
              ),
              const SizedBox(height: 20),

              // Tabs (Upcoming/Past)
              Row(
                children: [
                  _changeUpOrPast('Upcoming'),
                  const SizedBox(
                    width: 5,
                  ),
                  _changeUpOrPast('Past'),
                ],
              ),
              const SizedBox(height: 20),

              // Upcoming Tax Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                child: isUpcoming
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Aug 28, 2024 - Sep 5, 2024',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 243, 154, 148)),
                                child: const Text(
                                  'pay now',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Income Tax',
                                      style: TextStyle(fontSize: 12)),
                                  Text(
                                    '4000 etb',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Pension Tax',
                                      style: TextStyle(fontSize: 12)),
                                  Text(
                                    '5000 etb',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                width: 150,
                                child: const Text(
                                  'August Tax on due',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      )
                    : const Center(
                        child: Text(
                          'No past data avaliable at this time',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
              ),

              const SizedBox(height: 20),

              // Employee Composition and Tax Summary
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Employee Composition',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            children: [
                              Image.asset('assets/images/Group 258.png'),
                              Positioned(
                                  left: -30,
                                  top: -10,
                                  child: Image.asset(
                                      'assets/images/Frame 23.png')),
                              Positioned(
                                  top: 25,
                                  right: -30,
                                  child: Image.asset(
                                      'assets/images/Frame 24.png')),
                            ],
                          ),
                          Text(
                            '856 employee total',
                            style: TextStyle(fontSize: 7),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tax Summary',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Text(
                            '9,349.85 etb',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '49.98% ^',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Set the current index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index
          });
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/management');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/profile');
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
                  Icon(Icons.home),
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
                  Icon(Icons.calendar_today),
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
                  Icon(Icons.person),
                ],
              ),
              label: ''),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      height: 130,
      width: 190,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
                fontSize: 16, color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _changeUpOrPast(String name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isUpcoming = name == 'Upcoming';
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color:
              isUpcoming && name == 'Upcoming' || !isUpcoming && name == 'Past'
                  ? Colors.blue
                  : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: isUpcoming && name == 'Upcoming' ||
                    !isUpcoming && name == 'Past'
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
