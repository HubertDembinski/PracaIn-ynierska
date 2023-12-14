import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pracainzynierska/HomePageUserLoggedIn.dart';
import 'package:pracainzynierska/LoginScreen.dart';

class CheckLogin2 extends StatefulWidget {
  const CheckLogin2({super.key});

  @override
  State<CheckLogin2> createState() => _CheckLogin2State();
}

class _CheckLogin2State extends State<CheckLogin2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePageUserLoggedIn();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
