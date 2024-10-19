import 'package:flutter/material.dart';
import 'login.dart'; // Import the Login page
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Direct the app to the login page
    ),
  );
}
