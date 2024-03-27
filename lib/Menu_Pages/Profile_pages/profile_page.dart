import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_shop/global/common/toast.dart';
import 'package:project_shop/startups/login_page.dart';
import 'account_settings.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

String? profileNames;
int? phoneNumbers;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  MyProfilePage createState() => MyProfilePage();
}

class MyProfilePage extends State<ProfilePage> {
  File? _image; 
  bool loggingOut = false;
  @override
  void initState() {
    super.initState();
    _image = null;
  }

  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      },
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(
              70,
              25,
            ),
          ),
        ),
        backgroundColor: Colors.orange,
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  _image == null
                      ? const CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              AssetImage('assets/images/profile.JPG'),
                        )
                      : CircleAvatar(
                          radius: 75,
                          backgroundImage: FileImage(_image!),
                        ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 40.0,
                    height: 40.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                    child: InkWell(
                      onTap: pickImage,
                      borderRadius: BorderRadius.circular(20.0),
                      child: const Center(
                        child: Icon(
                          Icons.camera_alt,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    profileNames ?? '',
                    //'Muhammad Talha',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    phoneNumbers?.toString() ?? '',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(60, 158, 158, 158),
            height: 40,
            thickness: 2,
            indent: 50,
            endIndent: 55,
          ),
          FloatingActionButton.extended(
            heroTag: 'account_settings_button',
            elevation: 0,
            extendedPadding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            label: const Text(
              'Account Settings',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.orange,
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountSettingsPage(),
                ),
              );
            },
          ),
          const Divider(
            color: Color.fromARGB(60, 158, 158, 158),
            height: 40,
            thickness: 2,
            indent: 50,
            endIndent: 55,
          ),
          FloatingActionButton.extended(
            heroTag: 'logout_button',
            elevation: 0,
            extendedPadding: const EdgeInsets.symmetric(
              horizontal: 75,
            ),
            label: const Text(
              'Log Out',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.orange,
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
              showToast(message: 'Successfully loged out');
            },
          ),
        ],
      ),
    );
  }
}
