import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/dragable_widget.dart';

class Welocme extends StatefulWidget {
  const Welocme({super.key});

  @override
  State<Welocme> createState() => _WelocmeState();
}

class _WelocmeState extends State<Welocme> {
  bool _showDragWidget = false;
  bool _showLoading = true;

  @override
  void initState() {
    super.initState();
    // Start a timer to show the DragWidget after 5 seconds
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showDragWidget = true;
        _showLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 83, 152, 243),
      body: Stack(
        children: [
          Positioned(
            top: 230,
            left: 100,
            right: 100,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.values[2],
                children: [
                  Image.asset('assets/images/Group 39518.png'),
                  const Text('DEMOZ',
                      style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          if (_showLoading)
            const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          if (_showDragWidget)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300, // Set a fixed height for the DragWidget
                child: const DragWidget(),
              ),
            ),
        ],
      ),
    );
  }
}
