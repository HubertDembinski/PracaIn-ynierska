import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pracainzynierska/CheckLogin2.dart';
import 'package:pracainzynierska/User.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Widget buildUser(User user) => ListTile(
        contentPadding: const EdgeInsets.only(top: 70),
        leading: Text(user.name),
        title: Text(user.lastName),
        subtitle: Text(user.email),
      );

  Stream<List<User>> readUser() => FirebaseFirestore.instance
      .collection('Uzytkownicy')
      .snapshots()
      .map((snapshots) =>
          snapshots.docs.map((doc) => User.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffde428),
        iconTheme: const IconThemeData(color: Color(0xff002e5b)),
        title: Text(
          "TEST",
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CheckLogin2()));
            },
            icon: const Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: readUser(),
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
