import 'package:flutter/material.dart';
import 'feedbackPage.dart';
import 'aboutPage.dart'; // Import the AboutPage
import 'main.dart';
import 'newProjectPage.dart';
import 'recentProjectsPage.dart'; // Import the NewProjectPage
import 'likedProjectsPage.dart';

class DashboardPage extends StatelessWidget {
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF4A148C),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Handle navigation to Profile page
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('New Project'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewProjectPage()),
                ); // Handle navigation to New Project page
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Recent Projects'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecentProjectsPage()),
                ); // Handle navigation to Recent Projects page
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Liked Projects'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LikedProjectsPage()),
                ); // Handle navigation to Liked Projects page
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                // Navigate to the AboutPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text('Feedback'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackPage()),
                ); // Handle navigation to Feedback page
              },
            ),
            const Divider(), // Optional: adds a visual separator
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Navigate to the HomePage (LoginPage)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/Plan it logo3.jpg', // Image asset path
              width: 350, // Adjust width as needed
              height: 350, // Adjust height as needed
              fit: BoxFit.contain, // Keep aspect ratio
            ),
            const SizedBox(height: 10), // Space between image and button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewProjectPage()),
                ); // Define the action for the button here
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF4A148C), // Button color
                padding: const EdgeInsets.symmetric(
                    horizontal: 50, vertical: 15), // Button padding
              ),
              child: const Text(
                'New Project',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20), // Additional space at the bottom
          ],
        ),
      ),
    );
  }
}
