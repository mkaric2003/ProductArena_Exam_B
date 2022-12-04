// ignore_for_file: body_might_complete_normally_nullable, prefer_const_constructors, empty_statements

import 'package:flutter/material.dart';
import 'package:product_arena_fullstack_exam_b/features/auth/services/auth_service.dart';
import 'package:product_arena_fullstack_exam_b/features/auth/widgets/custom_button.dart';
import 'package:product_arena_fullstack_exam_b/features/home/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService authService = AuthService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final _signUpFormKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
  bool isHiddenConfirmPassword = true;

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
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
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
                key: _signUpFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(239, 239, 244, 1),
                        filled: true,
                        label: Text(
                          'Name',
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
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(emailFocusNode),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Unesi ime';
                        }
                      },
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.019,
                    ),
                    TextFormField(
                      controller: emailController,
                      focusNode: emailFocusNode,
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
                        } else if (value.length <= 6) {
                          return 'Password mora sadržati više od 6 karaktera';
                        }
                      },
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.019,
                    ),
                    CustomButton(
                      onTap: signUpUser,
                      text: 'Sign Up',
                    ),
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
