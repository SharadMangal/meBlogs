// lib/widgets/custom_drawer.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pages/about_page.dart'; // Update the import path based on your project structure
import '../widgets/profile_avatar.dart';
import '../pages/explore_page.dart'; // Update the import path based on your project structure
import 'package:firebase_auth/firebase_auth.dart';


class CustomDrawer extends StatelessWidget {
  final ThemeData theme;

  const CustomDrawer({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270,
      backgroundColor: theme.scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.primaryColor,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileAvatar(radius: 40),
                const SizedBox(height: 10),
                const Text('Your Name', style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.box),
            title: const Text('Product', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          // ListTile(
          //   leading: const Icon(FontAwesomeIcons.compass),
          //   title: const Text('Explore', style: TextStyle(color: Colors.white)),
          //   onTap: () {
          //     Navigator.push(
          //                       context,
          //                       MaterialPageRoute(builder: (context) => const ExplorePage()),
          //                     );
          //   },
          // ),

          ListTile(
            leading: const Icon(FontAwesomeIcons.compass),
            title: const Text('Explore', style: TextStyle(color: Colors.white)),
            onTap: () {
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExplorePage()),
                );
              } else {
                Navigator.pushNamed(context, '/signup'); // redirect to Sign Up
              }
            },
          ),

          ListTile(
            leading: const Icon(FontAwesomeIcons.cogs),
            title: const Text('Resources', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.infoCircle),
            title: const Text('About', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}



