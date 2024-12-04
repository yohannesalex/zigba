import 'package:flutter/material.dart';
import 'package:zigba/features/auth/presentation/pages/signup.dart';
import 'package:zigba/features/auth/presentation/pages/welcome.dart';

import 'features/employee/presentation/company_register.dart';
import 'features/employee/presentation/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Lexend',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/signup': (context) => SignUpPage(),
        '/welcome': (context) => Welocme(),
        '/company_register': (context) => CompanyRegistration(),
      },
    );
  }
}
