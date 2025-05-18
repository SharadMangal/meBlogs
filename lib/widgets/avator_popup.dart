// widgets/profile_popup.dart
import 'package:flutter/material.dart';
import 'package:meblogs/pages/profile_page.dart';
import 'package:meblogs/pages/setting_page.dart';  // Adjust the import according to your project structure
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePopup extends StatelessWidget {
  final VoidCallback? onDismiss;  // Define the callback here

  const ProfilePopup({Key? key, this.onDismiss}) : super(key: key);  // Add to constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onDismiss?.call();  // Call onDismiss when tapping outside
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
              onDismiss?.call();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              // Navigator.pushNamed(context, '/profile');

              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                onDismiss?.call();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () async {
                onDismiss?.call(); // dismiss the popup (if controlled from outside)
                Navigator.of(context).pop(); // Close the popup itself

                await FirebaseAuth.instance.signOut();

                // Navigate to login or home (if needed), or show a snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out')),
                );

                // Optional: Navigate to login screen
                // Navigator.pushReplacementNamed(context, '/login');
              },

            ),

          ],
        ),
      ),
    );
  }
}

