import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:pracainzynierska/HomePageUserLoggedIn.dart';
//import 'package:pracainzynierska/User.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final userLogged = FirebaseAuth.instance.currentUser!;

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool isLoading = false;

  Widget buildUser(User user) => Column(
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
                      child: Text(
                        'Imie',
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff002e5b),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 260,
                      child: TextField(
                        controller: nameController,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 20),
                        cursorColor: const Color(0xff002e5b),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15),
                          isCollapsed: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xfffde428),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xfffde428),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          labelText: user.name,
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
                      child: Text(
                        'Nazwisko',
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff002e5b),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 260,
                      child: TextField(
                        controller: lastNameController,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 20),
                        cursorColor: const Color(0xff002e5b),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15),
                          isCollapsed: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xfffde428),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xfffde428),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          labelText: user.lastName,
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
                      child: Text(
                        'Numer telefonu',
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff002e5b),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 260,
                      child: TextField(
                        controller: phoneNumberController,
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(fontSize: 20),
                        cursorColor: const Color(0xff002e5b),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15),
                          isCollapsed: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xfffde428),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xfffde428),
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          labelText: user.phoneNumer,
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfffde428),
                        padding: const EdgeInsets.all(15),
                        shape: const CircleBorder(),
                      ),
                      onPressed: () async {
                        if (isLoading) return;
                        setState(() => isLoading = true);
                        await Future.delayed(const Duration(seconds: 2));
                        final updateUser = FirebaseFirestore.instance
                            .collection('Uzytkownicy')
                            .doc(user.id);

                        updateUser.update({
                          'imie': nameController.text,
                          'nazwisko': lastNameController.text,
                          'numer telefonu': phoneNumberController.text
                        });
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
                              Icons.save,
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
      );

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('Uzytkownicy')
      .where('email', isEqualTo: userLogged.email)
      .snapshots()
      .map((snapshots) =>
          snapshots.docs.map((doc) => User.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<User>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Coś poszło nie tak! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final user = snapshot.data!;

            return ListView(
              children: user.map(buildUser).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        name: json['imie'],
        lastName: json['nazwisko'],
        phoneNumer: json['numer telefonu'],
      );
}
