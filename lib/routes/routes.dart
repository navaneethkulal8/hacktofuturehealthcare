import 'package:get/get.dart';
import 'package:gomedic/navbar/navbar.dart';
import 'package:gomedic/pages/appointment.dart';
import 'package:gomedic/pages/diet.dart';
import 'package:gomedic/pages/home.dart';
import 'package:gomedic/pages/medication.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const NavBar()),
    GetPage(name: home, page: () => const Home()),
    GetPage(name: appointment, page: () => const Appointment()),
    GetPage(name: medication, page: () => const Medication()),
    GetPage(name: diet, page: () => const Diet()),
  ];

  static getnavbar() => navbar;
  static gethome() => home;
  static getappointment() => appointment;
  static getmedication() => medication;
  static getdiet() => diet;
  //
  static String navbar = '/';
  static String home = '/home';
  static String appointment = '/appointment';
  static String medication = '/medication';
  static String diet = '/diet';
}
