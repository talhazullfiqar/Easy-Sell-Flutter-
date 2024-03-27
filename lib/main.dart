import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_shop/firebase_options.dart';
import 'startups/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}
