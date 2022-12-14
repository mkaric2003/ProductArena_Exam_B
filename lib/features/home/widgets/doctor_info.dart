// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:product_arena_fullstack_exam_b/constants/global_variables.dart';
import 'package:product_arena_fullstack_exam_b/providers/user_provider.dart';
import 'package:provider/provider.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final deviceSize = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        Container(
          height: 80,
          width: 80,
          child: const FittedBox(
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/tech.webp',
              ),
            ),
          ),
        ),
        SizedBox(
          width: deviceSize.width * 0.04,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'My Profile',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}
