import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //final userTest = FirebaseAuth.instance.currentUser.uid?;
  final userID = FirebaseFirestore.instance.collection('Uzytkownicy').doc();

  /*
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  */

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    final user = User(
      id: userID.id,
      email: emailController.text,
    );

    addUserToDb(user);

    //addUserMailToDb(
    //  userID.toString().trim(),
    //  emailController.text.trim(),
    //);
  }

  /*
  Future addUserMailToDb(String id, String email) async {
    await FirebaseFirestore.instance.collection('Uzytkownicy').add({
      'id': id,
      'email': email,
    });
  }
  */

  Future addUserToDb(User user) async {
    final userID = FirebaseFirestore.instance.collection('Uzytkownicy').doc();
    user.id = userID.id;

    final json = user.toJson();

    await userID.set(json);
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffde428),
        iconTheme: const IconThemeData(color: Color(0xff002e5b), size: 30),
        title: Text(
          "ZAAREJESTRUJ",
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff002e5b)),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: 400,
              height: 600,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 90,
                        color: Color(0xff002e5b),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 50,
                        child: TextField(
                          controller: emailController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(fontSize: 20),
                          cursorColor: const Color(0xff002e5b),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xfffde428),
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xfffde428),
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              ),
                            ),
                            labelText: "E-mail",
                            prefixIcon: const Icon(
                              Icons.email,
                              size: 25,
                              color: Color(0xff002e5b),
                            ),
                            filled: true,
                            fillColor: const Color(0xfffde428),
                            labelStyle: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 50,
                        child: TextField(
                          controller: passwordController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(fontSize: 20),
                          cursorColor: const Color(0xff002e5b),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xfffde428),
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xfffde428),
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            labelText: "Hasło",
                            prefixIcon: const Icon(
                              Icons.lock,
                              size: 25,
                              color: Color(0xff002e5b),
                            ),
                            filled: true,
                            fillColor: const Color(0xfffde428),
                            labelStyle: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfffde428),
                          padding: const EdgeInsets.all(15),
                          shape: const CircleBorder(),
                        ),
                        onPressed: () async {
                          if (isLoading) return;
                          setState(() => isLoading = true);
                          await Future.delayed(const Duration(seconds: 5));
                          signUp();
                          setState(() => isLoading = false);
                        },
                        child: isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(7),
                                child: CircularProgressIndicator(
                                  color: Color(0xff002e5b),
                                ),
                              )
                            : const Icon(
                                Icons.arrow_forward,
                                size: 50,
                                color: Color(0xff002e5b),
                              ),
                        /*
                          onPressed: () async {
                            if (isLoading) return;
                            setState(() => isLoading = true);
                            await Future.delayed(const Duration(seconds: 5));
                            setState(() => isLoading = false);
                          },
                          */
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String id;
  final String email;
  String name;
  String lastName;
  String phoneNumer;

  User({
    this.id = '',
    required this.email,
    this.name = '',
    this.lastName = '',
    this.phoneNumer = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'imie': name,
        'nazwisko': lastName,
        'numer telefonu': phoneNumer,
      };
}
