import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_shop/Menu_Pages/Profile_pages/profile_page.dart';
import 'package:project_shop/startups/form_container_widget.dart';
import 'package:project_shop/startups/login_page.dart';

LoginPageState loginpage = LoginPageState();

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  MyAccountSettingsPage createState() => MyAccountSettingsPage();
}

class MyAccountSettingsPage extends State<AccountSettingsPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  @override
  void dispose() {
    phoneNumberController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 26, 26, 26),
        elevation: 0.5,
        title: const Text('Settings'),
        titleSpacing: 115.0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  _showChangeNumberDialogfornumber();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey,
                ),
                child: const Row(
                  children: [
                    Text(
                      'Change Number',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      width: 225,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(140, 158, 158, 158),
            height: 25,
            thickness: 2,
            indent: 20,
            endIndent: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  _showChangeNumberDialogforname();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey,
                ),
                child: const Row(
                  children: [
                    Text(
                      'Change Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      width: 243,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> setUserPhoneNumberFromEmail(
      String email, int? phonenumber) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('User Email', isEqualTo: email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(querySnapshot.docs.first.id)
            .update({'User PhoneNumber': phoneNumbers});
      } else {
        print('Email not found in Firestore');
        return null; // Email not found
      }
    } catch (e) {
      print('Error fetching data from Firestore: $e');
      return null; // Handle the error
    }
  }

  Future<void> setUserNameFromEmail(String email, String? profilename) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('User Email', isEqualTo: email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(querySnapshot.docs.first.id)
            .update({'User Name': profileNames});
      } else {
        print('Email not found in Firestore');
        return null; // Email not found
      }
    } catch (e) {
      print('Error fetching data from Firestore: $e');
      return null; // Handle the error
    }
  }

  Future<void> updateNumber() async {
    String email = loginpage.emailController.text;
    phoneNumbers = await int.parse(phoneNumberController.text);
    await setUserPhoneNumberFromEmail(email, phoneNumbers);
  }

  Future<void> updateName() async {
    String email = loginpage.emailController.text;
    profileNames = userNameController.text;
    await setUserNameFromEmail(email, profileNames);
  }

  // Function to show the dialog
  void _showChangeNumberDialogfornumber() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 26, 26, 26),
          title: Text(
            'Change Phone Number',
            style: TextStyle(color: Colors.white),
          ),
          content: FormContainerWidget(
            controller: phoneNumberController,
            hintText: "Phone Number",
            isPasswordField: false,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.orange),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  updateNumber();
                });
                Navigator.of(context).pop();
                _showSnackBar(
                    "Phone number updated: ${phoneNumberController.text}");
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.orange, // Customize snackbar color
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showChangeNumberDialogforname() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 26, 26, 26),
          title: Text(
            'Change Profile Name',
            style: TextStyle(color: Colors.white),
          ),
          content: FormContainerWidget(
            controller: userNameController,
            hintText: "Enter Name",
            isPasswordField: false,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.orange),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  updateName();
                });
                Navigator.of(context).pop();
                _showSnackBarforname(
                    "Profile Name updated: ${userNameController.text}");
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBarforname(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.orange, // Customize snackbar color
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
