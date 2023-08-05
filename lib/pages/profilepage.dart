import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
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
          title: Text('Diet'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Your diet plan for the week',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
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
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _changeSubtitle,
                      child: Text('Change Diet'),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(days[index]),
                      subtitle: Text(selectedDay == days[index]
                          ? selectedSubtitle.isNotEmpty
                              ? selectedSubtitle
                              : 'Diet plan for $selectedDay'
                          : 'Diet plan for ${days[index]}'),
                      trailing: Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}