import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

class AddAdvertisementPage extends StatefulWidget {
  const AddAdvertisementPage({super.key});

  @override
  State<AddAdvertisementPage> createState() => _AddAdvertisementPageState();
}

class _AddAdvertisementPageState extends State<AddAdvertisementPage> {
  final userLogged = FirebaseAuth.instance.currentUser!;
  late CollectionReference imgRef;
  late firebase_storage.Reference ref;

  List<File> image = [];
  final pickerImage = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 450,
              child: GridView.builder(
                itemCount: image.length + 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return index == 0
                      ? Container(
                          color: Color(0xfffde428),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              size: 50,
                              color: Color(0xff002e5b),
                            ),
                            onPressed: () {
                              chooseImageToUpload();
                            },
                          ),
                        )
                      : Container(
                          //margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(image[index - 1]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                },
              ),
            ),
            Row(
              children: [
                Container(
                  color: Colors.white,
                  width: 400,
                  height: 600,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            child: Text(
                              'Test',
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
                              //controller: lastNameController,
                              textAlignVertical: TextAlignVertical.center,
                              style: const TextStyle(fontSize: 20),
                              cursorColor: const Color(0xff002e5b),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                isCollapsed: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
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
                                labelText: "Test",
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
                              'Test',
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
                              //controller: phoneNumberController,
                              textAlignVertical: TextAlignVertical.center,
                              style: const TextStyle(fontSize: 20),
                              cursorColor: const Color(0xff002e5b),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                isCollapsed: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
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
                                labelText: "Test",
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
                            height: 300,
                            child: StreamBuilder<List<User>>(
                              stream: readUsers(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text(
                                      'Coś poszło nie tak! ${snapshot.error}');
                                } else if (snapshot.hasData) {
                                  final user = snapshot.data!;

                                  return Column(
                                    children: user.map(buildUser).toList(),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          )
                        ],
                        /*
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfffde428),
                              padding: const EdgeInsets.all(15),
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {
                              uploadImageToStorage();
                            },
                            child: Icon(
                              Icons.save,
                              size: 50,
                              color: Color(0xff002e5b),
                            ),
                          )
                        ],
                        */
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  chooseImageToUpload() async {
    final pickedImage =
        await pickerImage.pickImage(source: ImageSource.gallery);
    setState(() {
      image.add(
        File(pickedImage!.path),
      );
    });
    if (pickedImage?.path == null) lostData();
  }

  Future<void> lostData() async {
    final LostDataResponse response = await pickerImage.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('Uzytkownicy')
      .where('email', isEqualTo: userLogged.email)
      .snapshots()
      .map((snapshots) =>
          snapshots.docs.map((doc) => User.fromJson(doc.data())).toList());

  Widget buildUser(User user) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xfffde428),
          padding: const EdgeInsets.all(15),
          shape: const CircleBorder(),
        ),
        onPressed: () async {
          for (var img in image) {
            ref = firebase_storage.FirebaseStorage.instance
                .ref()
                .child('${user.id}/${Path.basename(img.path)}');
            await ref.putFile(img).whenComplete(
              () async {
                await ref.getDownloadURL().then(
                  (value) {
                    imgRef.add({'url': value});
                  },
                );
              },
            );
          }
        },
        child: Icon(
          Icons.save,
          size: 50,
          color: Color(0xff002e5b),
        ),
      );

  void initState() {
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('imageURLs');
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
