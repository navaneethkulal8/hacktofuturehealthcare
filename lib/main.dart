import 'package:flutter/material.dart';
import 'appointment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Search'),
    Text('Favorites'),
    Text('Profile'),
  ];

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Appointment()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Page',
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Appointment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medication),
              label: 'Medication',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_pizza_outlined),
              label: 'Diet',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (index) => _onItemTapped(index, context),
        ),
      ),
    );
  }
}
