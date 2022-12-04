// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:product_arena_fullstack_exam_b/features/auth/screens/login_screen.dart';
import 'package:product_arena_fullstack_exam_b/features/home/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(4, 231, 98, 1),
        )),
        home: const LoginScreen(),
        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
        });
  }
}
