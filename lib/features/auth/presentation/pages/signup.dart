import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zigba/features/auth/Domain/entity/user_entity.dart';
import 'package:zigba/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:zigba/features/auth/presentation/bloc/auth_event.dart';
import 'package:zigba/features/employee/presentation/pages/company_register.dart';

import '../bloc/auth_state.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isButtonEnabled = false;
  bool isvisisble = true;

  void _updateButtonState() {
    setState(() {
      String email = _emailController.text;
      String password = _passwordController.text;
      isButtonEnabled = email.contains('@') && password.length >= 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CompanyRegistration(
                  email: _emailController.text,
                ),
              ),
            );
          } else if (state is AuthErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          // TODO: implement listener
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 30, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Image.asset(
                    'assets/images/Group 2.png',
                  ),
                ),
                const Text(
                  'Welcome 👋',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const Row(
                  children: [
                    Text(
                      'to ',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'Demoz Payroll',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const Text('Hello there, Sign up to continue',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300)),
                const SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(children: [
                      TextField(
                        controller: _emailController,
                        style: const TextStyle(fontSize: 14),
                        onChanged: (_) => _updateButtonState(),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isButtonEnabled
                                  ? Colors.blue
                                  : Colors.black, // Color when not focused
                              width: 1.0,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          // Define the border when focused
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(
                                  255, 2, 16, 53), // Color when focused
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 45, 15, 5),
                        ),
                      ),
                      Positioned(
                          left: 20,
                          top: 5,
                          child: Text(
                            "Email Address",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color:
                                  isButtonEnabled ? Colors.blue : Colors.black,
                            ),
                          ))
                    ]),
                    const SizedBox(height: 20),
                    Stack(children: [
                      TextField(
                        controller: _passwordController,
                        onChanged: (_) => _updateButtonState(),
                        decoration: InputDecoration(
                          // Define the border when not focused
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: isButtonEnabled
                                  ? Colors.blue
                                  : Colors.black, // Color when not focused
                              width: 1.0,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          // Define the border when focused
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(
                                  255, 2, 16, 53), // Color when focused
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 45, 15, 5),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isvisisble
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                isvisisble = !isvisisble;
                              });
                            },
                          ),
                        ),
                        obscureText: !isvisisble,
                      ),
                      Positioned(
                          left: 20,
                          top: 5,
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color:
                                  isButtonEnabled ? Colors.blue : Colors.black,
                            ),
                          ))
                    ]),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () {
                              context.read<AuthBloc>().add(SignUpEvent(User(
                                  email: _emailController.text,
                                  password: _passwordController.text)));
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isButtonEnabled ? Colors.blue : Colors.grey,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Sign up'),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Or continue with social account',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 249, 243, 243)),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google.png',
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(width: 8),
                          const Text('Google'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Did you already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
