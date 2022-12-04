// ignore_for_file: unused_import, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:product_arena_fullstack_exam_b/common/widgets/custome_textfield.dart';
import 'package:product_arena_fullstack_exam_b/features/home/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        } else if (value != 'career@tech387.com') {
                          return 'Unesi ispravan email';
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
                        } else if (value != 'Pass123!') {
                          return 'Unesi ispravan password';
                        }
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: deviceSize.height * 0.028,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(4, 231, 98, 1),
                          elevation: 5,
                          minimumSize:
                              Size(MediaQuery.of(context).size.width * 0.9, 45),
                        ),
                        onPressed: () {
                          if (_loginFormKey.currentState!.validate()) {
                            Navigator.of(context)
                                .pushReplacementNamed(HomeScreen.routeName);
                          }
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
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
