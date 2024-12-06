import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zigba/features/auth/presentation/pages/signup.dart';
import 'package:zigba/features/auth/presentation/pages/welcome.dart';
import 'package:zigba/features/employee/presentation/pages/add_employee.dart';
import 'package:zigba/features/employee/presentation/pages/management.dart';
import 'package:zigba/features/employee/presentation/pages/profile.dart';
import 'package:zigba/features/employee/presentation/pages/company_register.dart';
import 'package:zigba/features/employee/presentation/pages/home.dart';
import 'package:zigba/features/auth/presentation/pages/login.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/employee/presentation/bloc/company_bloc.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox('userBox'); // Box for user data
  await Hive.openBox('companyBox'); // Box for company data

  // Initialize dependency injection
  await di.init();

  // Run the app
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(sl(), sl()),
        ),
        BlocProvider(
          create: (context) => CompanyBloc(sl(), sl()), // Provide CompanyBloc
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/': (context) => Welcome(),
        '/add_employee': (context) => EmployeeRegistration(),
        '/signup': (context) => SignUpPage(),
        '/company_register': (context) => CompanyRegistration(
              email: '',
            ),
        '/management': (context) => Management(
              email: '',
            ),
        '/profile': (context) => Profile(email: ''),
        '/home': (context) => HomePage(
              email: '',
            ),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
