import 'package:flutter/material.dart';
import 'package:helpnexus/views/HomePage.dart';
import 'package:helpnexus/views/LoginPage_for_agency.dart';
import 'package:helpnexus/views/Page2.dart';
import 'package:helpnexus/views/Page3.dart';
import 'package:helpnexus/views/Profile.dart';
import 'package:helpnexus/views/RegisterPage.dart';
import 'package:helpnexus/views/Register_page_for_agency.dart';
import 'package:helpnexus/views/about_us.dart';
import 'package:helpnexus/views/Help.dart';
import 'package:helpnexus/views/introPage.dart';
import 'package:helpnexus/views/login.dart';
import 'package:helpnexus/views/splashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MyWidget(),
      routes: {
        '/register/': (context) => const RegisterPage(),
        '/login/': (context) => const loginPage(),
        '/home/': (context) => const HomePage(),
        '/profile/': (context) => const Profile(),
        '/aboutUs/': (context) => const aboutUs(),
        '/help/': (context) => const Help(),
        '/registera/': (context) => const RegisterAgency(),
        '/intro/': (context) => const Intro(),
      },
    ),
  );
}

Future<bool> showlogoutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: Color.fromARGB(255, 190, 187, 184),
            title: const Text('Log Out!'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Logout')),
            ]);
      }).then((value) => value ?? false);
}
