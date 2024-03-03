import 'package:flutter/material.dart';

class RegisterAgency extends StatefulWidget {
  const RegisterAgency({super.key});

  @override
  State<RegisterAgency> createState() => _RegisterAgencyState();
}

class _RegisterAgencyState extends State<RegisterAgency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Agency Registration',
              style: TextStyle(
                fontFamily: 'Comic Neue',
                fontSize: 30,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text('API Key : '),
            ),
            Container(
              margin: const EdgeInsets.only(right: 30, left: 30),
              child: const TextField(
                decoration:
                    InputDecoration(hintText: 'x x x x x x x x x x x x x x'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: const Text('Role Based Access Control (RBAC) : '),
            ),
            Container(
              margin: const EdgeInsets.only(right: 30, left: 30),
              child: const TextField(),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: const Text('Agency Identification Number :'),
            ),
            Container(
              margin: const EdgeInsets.only(right: 30, left: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'x x x x x x x x x x x x x x',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: const Text('Password : '),
            ),
            Container(
              margin: const EdgeInsets.only(right: 30, left: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '. . . . . . . . . . . . . . . . . . . . ',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/home/', (route) => false);
                },
                child: Text('Register'),
              ),
            ),
            Container(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/intro/', (route) => false);
                    },
                    child: Text('Go to the Register View')))
          ],
        ));
  }
}
