import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:gomedic/controller/controller.dart';
import 'package:gomedic/pages/appointment.dart';
import 'package:gomedic/pages/diet.dart';
import 'package:gomedic/pages/home.dart';
import 'package:gomedic/pages/medication.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final controller = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(
      builder: (context) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabindex,
            children: [
              Home(),
              Appointment(),
              Medication(),
              Diet(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.tabindex,
            onTap: controller.changeTabIndex,
            items: [
              _bottombarItem(IconlyBold.home, "Home"),
              _bottombarItem(IconlyBold.document, "note"),
              _bottombarItem(IconlyBold.chart, "note"),
              _bottombarItem(IconlyBold.setting, "note"),
            ],
          ),
        );
      },
    );
  }
}

BottomNavigationBarItem _bottombarItem(IconData icon, String label) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}
