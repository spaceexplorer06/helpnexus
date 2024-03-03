import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:helpnexus/firebase_options.dart';
import 'dart:developer' as devtools show log;

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
            body: FutureBuilder(
                future: Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform,
                ),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(30),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: 'InriaSerif',
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextField(
                                controller: _email,
                                enableSuggestions: false,
                                autocorrect: false,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    hintText: 'Enter your email here'),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextField(
                                controller: _password,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your password here',
                                ),
                                obscureText: true,
                                autocorrect: false,
                                enableSuggestions: false,
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                final email = _email.text;
                                final password = _password.text;
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: email, password: password);
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/home/',
                                    (route) => false,
                                  );
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    devtools.log("Something bad happened");
                                  } else if (e.code == 'wrong-password') {
                                    devtools.log("Wrong Password");
                                  }
                                }
                              },
                              child: const Text(
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 157, 255),
                                ),
                                'Login',
                              )),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/register/', (route) => false);
                            },
                            child: const Text(
                                style: TextStyle(
                                    color: Color.fromARGB(255, 1, 175, 255)),
                                'Not Registered Yet? Register Now.'),
                          ),
                        ],
                      );
                    default:
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 255, 187, 16),
                        ),
                      );
                  }
                })));
  }
}
