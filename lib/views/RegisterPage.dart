import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose;
    _password.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              Color.fromRGBO(47, 128, 166, 1),
              Color.fromRGBO(101, 244, 251, 1),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(375),
            child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/images/Asset_appbar.png',
                  ),
                  fit: BoxFit.fill,
                )),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(2050)),
              ),
              backgroundColor: Colors.white,
              title: const Center(
                child: Text(
                  '',
                  style: TextStyle(
                    fontFamily: 'Comic Neue',
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          body: Container(
            //decoration: const BoxDecoration(
            //    gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            //  Color.fromARGB(255, 255, 255, 255),
            //  Color.fromARGB(255, 0, 0, 0)
            //])),
            child: Column(
              children: [
                Container(
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(
                        fontFamily: 'InriaSerif',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        InputDecoration(hintText: 'Enter your email here'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _password,
                    decoration:
                        InputDecoration(hintText: 'Enter your password here'),
                    obscureText: true,
                    autocorrect: false,
                    enableSuggestions: false,
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email, password: password);
                        devtools.log(userCredential.toString());
                        FirebaseFirestore.instance
                            .collection("Users")
                            .doc(userCredential.user!.email)
                            .set({
                          'username': email.split('@')[0], // Initial Username
                          'bio': 'Empty bio...' // Initially Empty Bio
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          devtools.log("Weak Password");
                        } else if (e.code == 'email-already-in-use') {
                          devtools.log("Email is already in use");
                        } else if (e.code == 'invalid-email') {
                          devtools.log("Invalid email");
                        }
                      }
                      const SnackBar(content: Text('Loading...'));
                    },
                    child: const Text(
                        style:
                            TextStyle(color: Color.fromARGB(255, 0, 157, 255)),
                        'Register')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/login/', (route) => false);
                    },
                    child: const Text(
                        style:
                            TextStyle(color: Color.fromARGB(255, 0, 157, 255)),
                        'Already Registered? Login here.'))
              ],
            ),
          ),
        ));
  }
}
