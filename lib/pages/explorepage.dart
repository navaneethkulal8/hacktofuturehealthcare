import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appointment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Appointment'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar with Filter Icon
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search for doctors...',
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.filter_list),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Previously Consulted Doctors
              Text(
                'Your Previous Doctors',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5), // Add space between title and avatars
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DoctorAvatar(
                      name: 'John Doe',
                      specialization: 'Cardiologist',
                      onCallPressed: () {
                        // Add your call functionality here
                      },
                      onMessagePressed: () {
                        // Add your message functionality here
                      },
                    ),
                    DoctorAvatar(
                      name: 'Jane Smith',
                      specialization: 'Dermatologist',
                      onCallPressed: () {
                        // Add your call functionality here
                      },
                      onMessagePressed: () {
                        // Add your message functionality here
                      },
                    ),
                    // Add more DoctorAvatar widgets here as needed
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Your Appointments
              Text(
                'Your Appointments',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              AppointmentCard(title: 'Appointment 1', doctor: 'John Doe'),
              const SizedBox(height: 10),
              AppointmentCard(title: 'Appointment 2', doctor: 'Jane Smith'),
              const SizedBox(height: 10),
              AppointmentCard(title: 'Appointment 3', doctor: 'John Doe'),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorAvatar extends StatelessWidget {
  final String name;
  final String specialization;
  final VoidCallback? onCallPressed;
  final VoidCallback? onMessagePressed;

  const DoctorAvatar({
    required this.name,
    required this.specialization,
    this.onCallPressed,
    this.onMessagePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Add elevation for a raised effect
      margin: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5), // Add margin for spacing
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Text(
                'DR',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              specialization,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: onCallPressed,
                ),
                IconButton(
                  icon: Icon(Icons.message),
                  onPressed: onMessagePressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String title;
  final String doctor;

  const AppointmentCard({
    required this.title,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Add elevation for a raised effect
      margin: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5), // Add margin for spacing
      child: ListTile(
        leading: Icon(Icons.calendar_today),
        title: Text(title),
        subtitle: Text('Doctor: $doctor'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {},
      ),
    );
  }
}
