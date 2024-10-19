import 'package:flutter/material.dart';
import 'signup.dart';
import 'forgotPassword.dart';
import 'dashboardPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false; // Track loading state

  Future<void> _login() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      // Navigate to dashboard if login is successful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } on FirebaseAuthException catch (e) {
      // Show specific error messages
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'No user found for that email.';
          break;
        case 'wrong-password':
          message = 'Wrong password provided for that user.';
          break;
        case 'invalid-email':
          message = 'The email address is not valid.';
          break;
        default:
          message = 'Login failed. Please try again.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } finally {
      setState(() {
        _isLoading = false; // Hide loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A148C),
        title: const Text(
          "Plan-it",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6A1B9A),
              Color(0xFF2196F3),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:
                    _isLoading ? null : _login, // Disable button while loading
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white) // Show loading indicator
                    : const Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 204, 177, 250), // Updated here
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: const Text(
                  "New user? Signup",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.5),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()),
                    );
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
