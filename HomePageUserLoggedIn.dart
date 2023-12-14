import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pracainzynierska/AccountPage.dart';
import 'package:pracainzynierska/AddAdvertisementPage.dart';

class HomePageUserLoggedIn extends StatefulWidget {
  const HomePageUserLoggedIn({super.key});

  @override
  State<HomePageUserLoggedIn> createState() => _HomePageUserLoggedInState();
}

class _HomePageUserLoggedInState extends State<HomePageUserLoggedIn> {
  final user = FirebaseAuth.instance.currentUser!;

  //get userMail => user.email;

  int selectedIndex = 0;

  void clickBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final screensLoggedIn = [
    const AddAdvertisementPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffde428),
        iconTheme: const IconThemeData(color: Color(0xff002e5b)),
        title: Text(
          user.email!,
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff002e5b)),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              //Navigator.push(context,
              // MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            icon: const Icon(
              Icons.logout,
              size: 30,
            ),
          ),
        ],
      ),
      body: screensLoggedIn[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xfffde428),
        currentIndex: selectedIndex,
        onTap: clickBottomBar,
        unselectedLabelStyle: GoogleFonts.openSans(
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        unselectedItemColor: const Color(0xff002e5b),
        iconSize: 25,
        selectedLabelStyle: GoogleFonts.openSans(
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
            ),
            label: 'Dodaj ogłoszenie',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Konto',
          ),
        ],
      ),
    );
  }
}
