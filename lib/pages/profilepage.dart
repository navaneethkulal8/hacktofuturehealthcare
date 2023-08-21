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

  void _changeSubtitle() {
    setState(() {
      selectedSubtitle = _subtitleController.text;
    });
  }

  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  @override
  void dispose() {
    _dayController.dispose();
    _subtitleController.dispose();
    super.dispose();
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.green],
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
                        const Text(
                          'Your diet plan for the week',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: _dayController,
                          decoration: const InputDecoration(
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
                          decoration: const InputDecoration(
                            hintText: 'Enter the Diet',
                            labelText: 'Diet Description',
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: _changeSubtitle,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                          ),
                          child: const Text('Change Diet'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: days.map((day) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 24,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                day,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                selectedDay == day
                                    ? selectedSubtitle.isNotEmpty
                                        ? selectedSubtitle
                                        : 'Diet plan for $selectedDay'
                                    : 'Diet plan for $day',
                              ),
                              SizedBox(height: 8.0),
                              Checkbox(
                                value: false,
                                onChanged: (bool? value) {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
