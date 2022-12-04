// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:product_arena_fullstack_exam_b/features/auth/screens/login_screen.dart';
import 'package:product_arena_fullstack_exam_b/features/auth/screens/signup_screen.dart';
import 'package:product_arena_fullstack_exam_b/features/auth/services/auth_service.dart';
import 'package:product_arena_fullstack_exam_b/features/home/screens/home_screen.dart';
import 'package:product_arena_fullstack_exam_b/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    authService.getUserData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(4, 231, 98, 1),
        )),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? const HomeScreen()
            : const LoginScreen(),
        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          SignUpScreen.routeName: (context) => const SignUpScreen(),
        });
  }
}
