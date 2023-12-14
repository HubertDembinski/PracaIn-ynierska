import 'package:flutter/material.dart';
import 'package:pracainzynierska/CheckLogin.dart';
import 'package:pracainzynierska/LoginScreen.dart';
//import 'package:pracainzynierska/RegisterScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    const MaterialApp(
      title: 'Program',
      home: CheckLogin(),
    ),
  );
}

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffde428),
        iconTheme: const IconThemeData(color: Color(0xff002e5b)),
        title: Text(
          "STRONA GŁÓWNA",
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
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            icon: const Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
