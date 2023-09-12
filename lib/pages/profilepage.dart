import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  String selectedDay = '';
  String selectedSubtitle = '';

  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  @override
  void dispose() {
    _dayController.dispose();
    _subtitleController.dispose();
    super.dispose();
  }

  // Update the selected subtitle when the button is pressed
  void _changeSubtitle() {
    setState(() {
      selectedSubtitle = _subtitleController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diet',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Diet'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDietContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDietContainer() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade50, Colors.green.shade50],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Weekly Diet Plan',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _dayController,
              decoration: InputDecoration(
                hintText: 'Enter the day',
                labelText: 'Day',
              ),
              onChanged: (value) {
                setState(() {
                  selectedDay = value;
                });
              },
            ),
            TextField(
              controller: _subtitleController,
              decoration: InputDecoration(
                hintText: 'Enter the Diet',
                labelText: 'Diet Description',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _changeSubtitle,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Change Diet'),
            ),
          ],
        ),
      ),
    );
  }
}
