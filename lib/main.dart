import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zigba/features/auth/presentation/pages/signup.dart';
import 'package:zigba/features/auth/presentation/pages/welcome.dart';
import 'package:zigba/features/employee/presentation/add_employee.dart';
import 'package:zigba/features/employee/presentation/management.dart';
import 'package:zigba/features/employee/presentation/profile.dart';

import 'features/auth/Domain/entity/user_entity.dart';
import 'features/auth/Domain/useCases/login_usecase.dart';
import 'features/auth/Domain/useCases/signUp_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login.dart';
import 'features/employee/presentation/company_register.dart';
import 'features/employee/presentation/home.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  await di.init();

  runApp(
    BlocProvider(
      create: (context) => AuthBloc(sl(), sl()),
      child: MyApp(),
    ),
  );
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
        '/': (context) => Welocme(),
        '/add_employee': (context) => EmployeeRegistration(),
        '/signup': (context) => SignUpPage(),
        '/company_register': (context) => CompanyRegistration(),
        '/management': (context) => Management(),
        '/profile': (context) => Profile(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
