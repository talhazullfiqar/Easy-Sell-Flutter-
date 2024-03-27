import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:project_shop/Menu_Pages/Profile_pages/profile_page.dart';
import 'package:project_shop/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:project_shop/global/common/toast.dart';
import 'package:project_shop/startups/form_container_widget.dart';
import 'package:project_shop/startups/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final GlobalKey<SignupPageState> globalKey = GlobalKey();
  final FirebaseAuthService auth = FirebaseAuthService();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSignUp = false;
  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
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
        backgroundColor: Colors.purple,
        title: const Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Icon(
                Icons.lock_open_outlined,
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(height: 20.0),
              FormContainerWidget(
                controller: userNameController,
                hintText: "User Name",
                isPasswordField: false,
              ),
              const SizedBox(height: 20.0), // Spacer
              FormContainerWidget(
                controller: phoneNumberController,
                hintText: "Phone Number",
                isPasswordField: true,
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
              const SizedBox(height: 20.0), // Spacer
              FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 0,
                extendedPadding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                label: isSignUp
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                backgroundColor: Colors.purple,
                icon: const Icon(
                  Icons.create_outlined,
                  size: 24.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  signup();
                  showToast(message: "User Successfully created");
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "  Already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future userdetails(String username, String email, int phoneNumber) async {
    //  profileNames = username;
    await FirebaseFirestore.instance.collection('users').add({
      'User Name': username,
      'User Email': email,
      'User PhoneNumber': phoneNumber,
    });
  }

  Future<void> signup() async {
    setState(() {
      isSignUp = true;
    });
    String email = emailController.text;
    String password = passwordController.text;
    String username = userNameController.text;
    int phoneNumber = int.parse(phoneNumberController.text);
    userdetails(username, email, phoneNumber);
    User? user = await auth.signupWithEmailAndPassword(email, password);

    setState(() {
      isSignUp = false;
    });
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    } else {
      showToast(message: 'Something went wrong');
    }
  }
}
