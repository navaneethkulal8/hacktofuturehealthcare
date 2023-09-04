import 'package:flutter/material.dart';
import 'package:gomedic/pages/explorepage.dart';
import 'package:gomedic/pages/homepage.dart';
import 'package:gomedic/pages/navigationpage.dart';
import 'package:gomedic/pages/profilepage.dart'; // Import the DietPage

class ControllerPage extends StatefulWidget {
  const ControllerPage({Key? key}) : super(key: key);

  @override
  _ControllerPageState createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    const ExplorePage(),
    NotificationsPage(),
    const ProfilePage(), // Use DietPage instead of ProfilePage
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 8.0,
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNavItem(Icons.home, "Home", 0),
              buildNavItem(Icons.calendar_today, "Appointment",
                  1), // Change "Calendar" to "Appointments"
              buildNavItem(Icons.medication, "Medication", 2),
              buildNavItem(
                  Icons.restaurant_menu, "Diet", 3), // Use Diet icon and label
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.grey,
            ),
            SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 10,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
