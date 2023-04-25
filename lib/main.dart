import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'My App', home: BottomNavBar());
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    ExplorePage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedIconTheme: IconThemeData(
          color: Colors.blue,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey[400],
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Medication',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String _message = 'Welcome to the Explore page!';

  void _changeMessage() {
    setState(() {
      _message = 'You tapped the button!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_message),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeMessage,
              child: Text('Tap me!'),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<String> _notifications = [];

  void _addNotification() {
    setState(() {
      int notificationNumber = _notifications.length + 1;
      _notifications.add('Notification $notificationNumber');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications Page'),
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_notifications[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNotification,
        tooltip: 'Add Notification',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSwitched = false;

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Dark Mode',
              style: Theme.of(context).textTheme.headline5,
            ),
            Switch(
              value: _isSwitched,
              onChanged: _toggleSwitch,
            ),
          ],
        ),
      ),
    );
  }
}
