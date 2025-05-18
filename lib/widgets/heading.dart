import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to your desired page here
        Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min, // Wrap tightly around content
        children: [
          Image.asset(
            'assets/logo.png', // your logo image path
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 8),
          const Text(
            'meBlogs',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
