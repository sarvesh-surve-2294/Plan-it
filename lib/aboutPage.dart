import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A148C),
        title: const Text(
          'Plan-it',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        // Center the content vertically and horizontally
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Ensures the column takes minimal space
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'About',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A148C),
                ),
                textAlign: TextAlign.center, // Center the text
              ),
              SizedBox(height: 20), // Space between "About" and the description
              Text(
                'Welcome to Plan-it, your personal AI-powered floor plan generator! '
                'This app is designed to help you create custom floor plans effortlessly. '
                'Whether you\'re a student, homeowner, architect, or interior designer, Plan-it makes it easy to turn your ideas '
                'into a structured, visual blueprint.\n\n'
                'With just a few inputs like the area, wall size, number & size of rooms, and layout preferences, our AI engine generates '
                'a professional floor plan tailored to your needs in seconds. Say goodbye to complex design tools—'
                'Plan-it offers a simple, user-friendly interface that brings your vision to life with accuracy and ease.\n\n'
                'Start designing smarter, faster, and better with Plan-it!',
                style: TextStyle(fontSize: 16),
                textAlign:
                    TextAlign.center, // Center-align the description text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
