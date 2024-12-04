import 'package:flutter/material.dart';

class Management extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
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
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 80, 243, 85),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.file_upload_outlined, color: Colors.grey),
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
                  columns: [
                    const DataColumn(label: Text('Employees')),
                    const DataColumn(label: Text('Net Salary')),
                    const DataColumn(label: Text('Taxable Earnings')),
                    const DataColumn(label: Text('Income Tax')),
                    const DataColumn(label: Text('Pension Tax')),
                    const DataColumn(label: Text('Gas Pay')),
                    const DataColumn(label: Text('Actions')),
                  ],
                  rows: _buildDataRows(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Management',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
      ),
    );
  }

  List<DataRow> _buildDataRows() {
    final data = [
      {
        "name": "Abraham Welde",
        "net": "15,000",
        "taxable": "2000",
        "income": "5000",
        "pension": "500",
        "gas": "300",
      },
      {
        "name": "Bisrat Alemu",
        "net": "25,000",
        "taxable": "3000",
        "income": "7000",
        "pension": "700",
        "gas": "400",
      },
      {
        "name": "Bisrate Girum",
        "net": "15,000",
        "taxable": "2000",
        "income": "5000",
        "pension": "500",
        "gas": "300",
      },
      {
        "name": "Alemu Molla",
        "net": "15,000",
        "taxable": "2000",
        "income": "5000",
        "pension": "500",
        "gas": "300",
      },
    ];

    return data.map((item) {
      return DataRow(
        cells: [
          _buildColoredCell(item["name"]!, 0),
          _buildColoredCell(item["net"]!, 1),
          _buildColoredCell(item["taxable"]!, 2),
          _buildColoredCell(item["income"]!, 3),
          _buildColoredCell(item["pension"]!, 4),
          _buildColoredCell(item["gas"]!, 5),
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
          border: Border.all(color: Colors.grey.shade300), // Visible border
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
        child: Text(value),
      ),
    );
  }
}
