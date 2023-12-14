import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pracainzynierska/ForgotPasswordPage.dart';
import 'package:pracainzynierska/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffde428),
        iconTheme: const IconThemeData(color: Color(0xff002e5b), size: 30),
        title: Text(
          "ZALOGUJ",
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff002e5b)),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()));
            },
            icon: const Icon(
              Icons.add_outlined,
              size: 30,
              color: Color(0xff002e5b),
            ),
          ),
        ],
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
                            contentPadding: const EdgeInsets.only(right: 25),
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
                                  fontSize: 20, color: Colors.black),
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
                            contentPadding: const EdgeInsets.only(right: 25),
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
                                  fontSize: 20, color: Colors.black),
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
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: const Size(250, 50)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordPage()));
                        },
                        child: Text(
                          "Przypomnij hasło?",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff002e5b),
                              fontWeight: FontWeight.bold,
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
                          signIn();
                          setState(() => isLoading = false);
                        },

                        //onPressed: signIn,
                        /*
                        child: Icon(
                          Icons.arrow_forward,
                          size: 50,
                          color: Color(0xff002e5b),
                        ),
                        */

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
