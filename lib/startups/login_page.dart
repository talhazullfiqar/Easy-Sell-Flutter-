import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_shop/Menu_Pages/Profile_pages/profile_page.dart';
import 'package:project_shop/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:project_shop/global/common/toast.dart';
import 'package:project_shop/home_navigtion.dart';
import 'package:project_shop/startups/form_container_widget.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final FirebaseAuthService auth = FirebaseAuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSignIn = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            'Login',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock,
              size: 100,
              color: Colors.orange,
            ),
            const SizedBox(height: 20.0), // Spacer
            FormContainerWidget(
              controller: emailController,
              hintText: "Email",
              isPasswordField: false,
            ),
            const SizedBox(height: 20.0), // Spacer
            FormContainerWidget(
              controller: passwordController,
              hintText: "Password",
              isPasswordField: true,
            ),
            const SizedBox(
              height: 1,
            ),
            // Signup Button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0), // Spacer
            FloatingActionButton.extended(
              elevation: 0,
              extendedPadding: const EdgeInsets.symmetric(
                horizontal: 70,
              ),
              label: isSignIn
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
              backgroundColor: Colors.orange,
              icon: const Icon(
                Icons.login,
                size: 24.0,
                color: Colors.white,
              ),
              onPressed: () {
                signin();
                showToast(message: 'Sucessfully Loged in');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // Signup Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> getUsernameFromEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('User Email', isEqualTo: email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first['User Name'];
      } else {
        print('Email not found in Firestore');
        return null; // Email not found
      }
    } catch (e) {
      print('Error fetching data from Firestore: $e');
      return null; // Handle the error
    }
  }

  Future<int?> getUserPhoneNumberFromEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('User Email', isEqualTo: email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first['User PhoneNumber'];
      } else {
        print('Email not found in Firestore');
        return null; // Email not found
      }
    } catch (e) {
      print('Error fetching data from Firestore: $e');
      return null; // Handle the error
    }
  }

  Future<void> signin() async {
    setState(() {
      isSignIn = true;
    });
    String email = emailController.text;
    String password = passwordController.text;
    profileNames = await getUsernameFromEmail(emailController.text);
    phoneNumbers = await getUserPhoneNumberFromEmail(emailController.text);
    User? user = await auth.signinWithEmailAndPassword(email, password);
    setState(() {
      isSignIn = false;
    });
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      showToast(message: 'Something went wrong');
    }
  }
}
