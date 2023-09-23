import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diet',
      home: ProfilePage(),
    );
  }
}

class DietPlan {
  final String day;
  final String dietDescription;

  DietPlan({
    required this.day,
    required this.dietDescription,
  });
}

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
  String selectedDietDescription = '';

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  List<DietPlan> dietPlans = [
    DietPlan(day: 'Monday', dietDescription: 'Healthy diet for Monday'),
    DietPlan(day: 'Tuesday', dietDescription: 'Nutritious diet for Tuesday'),
    DietPlan(day: 'Wednesday', dietDescription: 'Balanced diet for Wednesday'),
    DietPlan(
        day: 'Thursday', dietDescription: 'Protein-rich diet for Thursday'),
    DietPlan(day: 'Friday', dietDescription: 'Low-carb diet for Friday'),
    DietPlan(day: 'Saturday', dietDescription: 'Veggie diet for Saturday'),
    DietPlan(day: 'Sunday', dietDescription: 'Cheat day!'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2023, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  DietPlan? selectedPlan = dietPlans.firstWhere(
                    (plan) =>
                        plan.day == DateFormat('EEEE').format(selectedDay),
                    orElse: () => DietPlan(day: '', dietDescription: ''),
                  );
                  selectedDietDescription = selectedPlan.dietDescription;
                });
              },
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildDayTiles(),

            // Center the "Edit" button in the middle of the screen with a background color
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue, // Set the background color here
                  borderRadius:
                      BorderRadius.circular(8), // Optional: Add rounded corners
                ),
                child: TextButton(
                  onPressed: () {
                    // Show a dialog for editing the diet plan
                    _showEditDialog();
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.white, // Set text color for visibility
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Diet Plan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('You can edit the diet plan here.'),
              TextFormField(
                decoration: InputDecoration(labelText: 'Diet Description'),
                initialValue: selectedDietDescription,
                onChanged: (newValue) {
                  setState(() {
                    selectedDietDescription = newValue;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Handle save action here
                // For example, update the diet plan.
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                // Handle cancel action here
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDayTiles() {
    List<Widget> dayTiles = [];

    for (String day in days) {
      DietPlan? selectedPlan = dietPlans.firstWhere(
        (plan) => plan.day == day,
        orElse: () => DietPlan(day: '', dietDescription: ''),
      );

      dayTiles.add(
        Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text(
              '$day\'s Diet',
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Diet Description: ${selectedPlan.dietDescription}'),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: dayTiles,
    );
  }
}
