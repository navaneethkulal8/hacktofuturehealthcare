import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class DietPlan {
  final String day;
  final String morningDiet;
  final String eveningDiet;
  final String nightDiet;

  DietPlan({
    required this.day,
    required this.morningDiet,
    required this.eveningDiet,
    required this.nightDiet,
  });
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
  String morningDiet = '';
  String eveningDiet = '';
  String nightDiet = '';

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

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
                    // Implement logic to update your diet information based on the selected day.
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayTiles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: days.map((day) {
        final bool isSelectedDay = day == selectedDay;

        return Card(
          elevation: isSelectedDay ? 8 : 2,
          margin: EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text(
              'Today\'s Diet - $day',
              style: TextStyle(
                fontWeight: isSelectedDay ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Diet Description: $selectedSubtitle'),
                Text('Morning Diet: $morningDiet'),
                Text('Evening Diet: $eveningDiet'),
                Text('Night Diet: $nightDiet'),
              ],
            ),
            onTap: () {
              setState(() {
                selectedDay = day;
                // Implement logic to update the selected diet information based on the selected day.
              });
            },
          ),
        );
      }).toList(),
    );
  }
}
