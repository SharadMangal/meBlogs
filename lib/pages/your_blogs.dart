import 'package:flutter/material.dart';

class YourBlogs extends StatefulWidget {
  const YourBlogs({super.key});

  @override
  State<YourBlogs> createState() => _YourBlogs();
}
class _YourBlogs extends State<YourBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Blogs'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with your actual number of blogs
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Blog Title $index'),
              subtitle: Text('Blog description goes here.'),
            ),
          );
        },
      ),
    );
  }
}
