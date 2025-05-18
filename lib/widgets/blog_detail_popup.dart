import 'package:flutter/material.dart';
import 'like_button.dart';
import 'bookmark_icon.dart';

class BlogDetailPopup extends StatelessWidget {
  final Map<String, String> blog;

  const BlogDetailPopup({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                blog['title'] ?? '',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    blog['author'] ?? '',
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    '•',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    blog['date'] ?? '',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  blog['image']!,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                blog['content'] ?? '',
                style: const TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  LikeButton(),
                  Icon(Icons.comment, size: 20, color: Colors.grey),
                  Icon(Icons.share, size: 20, color: Colors.grey),
                  BookmarkButton(),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}
