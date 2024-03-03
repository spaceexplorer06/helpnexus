import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('How to Use?')),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 50),
              height: 25,
              width: 300,
              child: Text(
                'Register/Login to the app',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(5),
              height: 25,
              width: 200,
              child: Text(
                'Give location access',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(5),
              height: 30,
              width: 50,
              child: Text('OR'),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              height: 30,
              width: 600,
              child: Text('Enter Location Manually'),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              height: 30,
              width: 600,
              child: Text(
                'Go to Search panel to search for Registered Agencies using their Name or ID',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 100,
            width: 300,
            child: Text(
              'You can also find nearby rescue agencies by clicking on GET HELP on HOME PAGE',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
