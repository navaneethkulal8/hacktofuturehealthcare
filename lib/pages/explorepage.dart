import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

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
                        name: 'John Doe', specialization: 'Cardiologist'),
                    DoctorAvatar(
                        name: 'Jane Smith', specialization: 'Dermatologist'),
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

  const DoctorAvatar({
    required this.name,
    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10), // Add space between title and avatar
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
        ],
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
