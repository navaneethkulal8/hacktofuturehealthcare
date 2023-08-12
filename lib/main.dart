import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:gomedic/pages/controllerpage.dart';
// import 'package:gomedic/pages/loginpage.dart';
// import 'package:gomedic/pages/createaccount.dart';
import 'package:gomedic/pages/profilepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gomedic',
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ProfilePage(); // Display the HomePage directly
  }
}

// class AuthWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           final user = snapshot.data;
//           if (user != null) {
//             // User is logged in, navigate to the ControllerPage.
//             return ControllerPage();
//           } else {
//             // User is not logged in, show the LoginPage.
//             return LoginPage();
//           }
//         } else {
//           // Show a loading indicator or splash screen while checking the user's authentication state.
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }

