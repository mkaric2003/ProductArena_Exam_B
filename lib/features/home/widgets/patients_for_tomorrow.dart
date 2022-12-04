import 'package:flutter/material.dart';

class PatientItem extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final String reason;
  final String scheduledTime;
  const PatientItem({
    Key? key,
    required this.name,
    required this.avatarUrl,
    required this.reason,
    required this.scheduledTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(avatarUrl),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        '$scheduledTime · $reason',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
