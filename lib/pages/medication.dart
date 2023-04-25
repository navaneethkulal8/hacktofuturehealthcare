import 'package:flutter/material.dart';

class Medication extends StatefulWidget {
  const Medication({Key? key}) : super(key: key);

  @override
  State<Medication> createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
