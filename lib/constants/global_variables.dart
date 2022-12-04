import 'package:product_arena_fullstack_exam_b/models/patient.dart';

String uri = 'http://192.168.0.18:3000';

class GlobalVariables {
  static List<Patient> today = [
    Patient(
      name: 'Alen K.',
      scheduledTime: '16:00',
      reason: 'Common cold',
      avatarUrl: 'assets/images/rect6.png',
    ),
    Patient(
      name: 'Amy F.',
      scheduledTime: '16:30',
      reason: 'Right Arm Pain',
      avatarUrl: 'assets/images/rect7.png',
    ),
    Patient(
      name: 'Kim H',
      scheduledTime: '18:30',
      reason: 'Covid 19',
      avatarUrl: 'assets/images/rect8.png',
    ),
  ];
  static List<Patient> tomorrow = [
    Patient(
      name: 'Andy A.',
      scheduledTime: '08:00',
      reason: 'Common cold',
      avatarUrl: 'assets/images/rect1.png',
    ),
    Patient(
      name: 'Bell B.',
      scheduledTime: '09:30',
      reason: 'Headache',
      avatarUrl: 'assets/images/rect2.png',
    ),
    Patient(
      name: 'Fiana L.',
      scheduledTime: '10:10',
      reason: 'Covid 19',
      avatarUrl: 'assets/images/rect3.png',
    ),
    Patient(
      name: 'Nezir B.',
      scheduledTime: '11.00',
      reason: 'Broken Heart',
      avatarUrl: 'assets/images/rect4.png',
    ),
    Patient(
      name: 'Alen K.',
      scheduledTime: '16:00',
      reason: 'Common cold',
      avatarUrl: 'assets/images/rect6.png',
    ),
    Patient(
      name: 'Amy F.',
      scheduledTime: '16:30',
      reason: 'Right Arm Pain',
      avatarUrl: 'assets/images/rect7.png',
    ),
    Patient(
      name: 'Kim H',
      scheduledTime: '18:30',
      reason: 'Covid 19',
      avatarUrl: 'assets/images/rect8.png',
    ),
  ];
}
