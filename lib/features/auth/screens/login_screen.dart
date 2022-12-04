// ignore_for_file: unused_import, body_might_complete_normally_nullable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:product_arena_fullstack_exam_b/features/auth/screens/signup_screen.dart';
import 'package:product_arena_fullstack_exam_b/features/auth/services/auth_service.dart';
import 'package:product_arena_fullstack_exam_b/features/auth/widgets/custom_button.dart';
import 'package:product_arena_fullstack_exam_b/features/home/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final _loginFormKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void logInUser() {
    authService.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: deviceSize.height * 0.32,
                left: deviceSize.width * 0.08,
                right: deviceSize.width * 0.088,
              ),
              child: Image.asset('assets/images/productarena.png'),
            ),
            SizedBox(
              height: deviceSize.height * 0.066,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceSize.width * 0.08,
              ),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(239, 239, 244, 1),
                        filled: true,
                        label: Text(
                          'E-mail',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(
                              146,
                              146,
                              146,
                              1,
                            ),
                          ),
                        ),
                      ),
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(passwordFocusNode),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Unesi e-mail';
                        }
                      },
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.019,
                    ),
                    TextFormField(
                      focusNode: passwordFocusNode,
                      controller: passwordController,
                      obscureText: isHiddenPassword,
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(239, 239, 244, 1),
                        filled: true,
                        label: const Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: togglePasswordView,
                          child: Icon(
                            isHiddenPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(
                              146,
                              146,
                              146,
                              1,
                            ),
                          ),
                        ),
                      ),
                      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Unesi password';
                        }
                      },
                    ),
                    CustomButton(
                      onTap: logInUser,
                      text: 'Log In',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(SignUpScreen.routeName);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(4, 231, 98, 1),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
