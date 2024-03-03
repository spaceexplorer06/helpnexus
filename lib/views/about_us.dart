import 'package:flutter/material.dart';

class aboutUs extends StatefulWidget {
  const aboutUs({super.key});

  @override
  State<aboutUs> createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('About Us')),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              height: 175,
              width: 400,
              child: const Text(
                'This app will help the user to escape easily from any trouble by establishing a link between user and the concerened agencies',
                style: TextStyle(fontFamily: 'Ingrid Darling', fontSize: 30),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              margin: const EdgeInsets.all(0),
              height: 125,
              width: 400,
              child: const Text(
                'It will include a map that shows the location of all the registered rescue agencies.',
                style: TextStyle(fontFamily: 'Ingrid Darling', fontSize: 30),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              margin: const EdgeInsets.all(0),
              height: 175,
              width: 400,
              child: const Text(
                'Designed and coded by Tech-Tribe, team of first year B.Tech students.',
                style: TextStyle(fontFamily: 'Ingrid Darling', fontSize: 30),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/home/', (route) => false);
              },
              child: const Text('Back to Home'),
            ),
          )
        ],
      ),
    );
  }
}
