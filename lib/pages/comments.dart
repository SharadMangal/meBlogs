import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _Comments();
}
class _Comments extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with your actual number of comments
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Comment Title $index'),
              subtitle: Text('Comment description goes here.'),
            ),
          );
        },
      ),
    );
  }
}
