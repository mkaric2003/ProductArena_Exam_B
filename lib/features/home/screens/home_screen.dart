// ignore_for_file: unused_import, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:product_arena_fullstack_exam_b/constants/global_variables.dart';
import 'package:product_arena_fullstack_exam_b/features/auth/screens/login_screen.dart';
import 'package:product_arena_fullstack_exam_b/features/home/widgets/doctor_info.dart';
import 'package:product_arena_fullstack_exam_b/features/home/widgets/patients_for_tomorrow.dart';
import 'package:product_arena_fullstack_exam_b/models/user.dart';
import 'package:provider/provider.dart';
import '';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    void logOut() {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: deviceSize.width * 0.4,
              height: deviceSize.height * 0.037,
              child: Image.asset(
                'assets/images/productarena.png',
                fit: BoxFit.cover,
              ),
            ),
            IconButton(
              onPressed: logOut,
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: deviceSize.width * 0.04,
            top: deviceSize.height * 0.042,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // =================> Custom widget za informacije o doktoru
              DoctorInfo(),
              // <=================
              SizedBox(
                height: deviceSize.height * 0.028,
              ),
              Text(
                'Patient list for today',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.028,
              ),
              // =================> Kolona u kojoj će se prikazati danas zakazani pacijenti
              Column(
                children: GlobalVariables.today
                    .map((patient) => PatientItem(
                        name: patient.name,
                        avatarUrl: patient.avatarUrl,
                        reason: patient.reason,
                        scheduledTime: patient.scheduledTime))
                    .toList(),
              ),
              // <=================
              SizedBox(
                height: deviceSize.height * 0.037,
              ),
              Text(
                'Tomorrow',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // =================> Kolona u kojoj će se prikazati sutra zakazani pacijenti
              Column(
                children: GlobalVariables.tomorrow
                    .map((patient) => PatientItem(
                        name: patient.name,
                        avatarUrl: patient.avatarUrl,
                        reason: patient.reason,
                        scheduledTime: patient.scheduledTime))
                    .toList(),
              ),
              // <=================
            ],
          ),
        ),
      ),
    );
  }
}
