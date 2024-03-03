import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:helpnexus/firebase_options.dart';
import 'package:helpnexus/main.dart';
import 'package:helpnexus/views/Page1.dart';
import 'package:helpnexus/views/Page2.dart';
import 'package:helpnexus/views/Page3.dart';
import 'package:helpnexus/views/login.dart';
import 'dart:ui';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = (FirebaseAuth.instance.currentUser);
              if (user == FirebaseAuth.instance.currentUser) {
                return const loginPage();
              } else {
                return const HomePage();
              }
            default:
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 77, 216, 198),
                ),
              );
          }
        });
  }
}

enum MenuAction { profile, aboutUs, help, logout }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final screens = const [Page1(), Page2(), Page3()];
  int index = 0;
  Future<void> editField(String field) async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      backgroundColor: Color.fromARGB(255, 254, 254, 254),
      bottomNavigationBar: CurvedNavigationBar(
          color: Color.fromARGB(255, 106, 105, 104),
          animationCurve: Curves.easeOutCubic,
          buttonBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
          height: 65,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          animationDuration: const Duration(milliseconds: 300),
          items: const [
            Icon(
              Icons.home,
              color: Color.fromARGB(255, 202, 202, 202),
              size: 30,
            ),
            Icon(
              Icons.search,
              color: Color.fromARGB(255, 202, 202, 202),
              size: 30,
            ),
            Icon(
              Icons.question_mark,
              color: Color.fromARGB(255, 202, 202, 202),
              size: 30,
            ),
          ],
          onTap: (index) => setState(() {
                this.index = index;
              })),
    );
  }
}
