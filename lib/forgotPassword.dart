import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
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
                "Reset Password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'New Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add password reset logic here
                },
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 204, 177,
                      250), // Updated here to use backgroundColor
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
