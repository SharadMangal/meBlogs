import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/heading.dart';
import '../widgets/like_button.dart';
import '../widgets/bookmark_icon.dart';
import '../widgets/blog_detail_popup.dart';
import '../widgets/avator_popup.dart';
import '../widgets/profile_avatar.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int selectedIndex = 0;

  final List<String> categories = ['You', 'Following', 'Trending'];

  final List<Map<String, String>> blogs = [
    {
      'author': 'Alice',
      'date': 'May 14, 2025',
      'title': 'The Future of Tech',
      'content': 'Explore how AI and quantum computing will shape the next generation...',
      'image': 'assets/blog1.jpeg',
    },
    {
      'author': 'Bob',
      'date': 'May 10, 2025',
      'title': 'Minimalism in Design',
      'content': 'Discover the beauty of doing more with less in UI/UX trends today...',
      'image': 'assets/blog2.jpeg',
    },
    {
      'author': 'Charlie',
      'date': 'May 8, 2025',
      'title': 'Remote Work Tips',
      'content': 'Staying productive from home: tips, tools, and mindset shifts...',
      'image': 'assets/blog3.jpeg',
    },
  ];




  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.red,
      cardColor: Colors.white.withOpacity(0.1),
    );

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: const Heading(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23),
            child: Builder(
              builder: (context) {
                OverlayEntry? overlayEntry;

                void showOverlay(TapDownDetails details) {
                  final overlay = Overlay.of(context);
                  final tapPosition = details.globalPosition;

                  overlayEntry = OverlayEntry(
                    builder: (context) => Positioned(
                      top: tapPosition.dy + 10, // Slightly below the tap
                      left: tapPosition.dx - 150, // Adjust left to position popup properly
                      width: 200, // Set popup width
                      child: Material(
                        color: Colors.transparent,
                        child: ProfilePopup(
                          onDismiss: () {
                            overlayEntry?.remove();
                            overlayEntry = null;
                          },
                        ),
                      ),
                    ),
                  );
                  overlay.insert(overlayEntry!);
                }
                return GestureDetector(
                  onTapDown: showOverlay,
                  child: const ProfileAvatar(
                    radius: 22,
                  ),
                );
              },
            ),
          ),

],
      ),
      drawer: CustomDrawer(theme: theme),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 48,
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.white70),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Search blogs...',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Selector row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(categories.length, (index) {
                final isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap: () {
                    setState(() => selectedIndex = index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? theme.primaryColor : theme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),

            // Blog list
            Expanded(
              child: ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  final blog = blogs[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        // Left: Blog content
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: blog['author'],
                                        style: const TextStyle(color: Colors.red, fontSize: 12),
                                      ),
                                      const TextSpan(
                                        text: ' • ',
                                        style: TextStyle(color: Colors.grey, fontSize: 12),
                                      ),
                                      TextSpan(
                                        text: blog['date'],
                                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 6),
                                Text(blog['title'] ?? '',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                const SizedBox(height: 8),
                                Text(
                                  blog['content'] ?? '',
                                  style: const TextStyle(color: Colors.white70),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),



                                const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // READ tag on left
                                      // Container(
                                      //   padding: const EdgeInsets.symmetric(horizontal: 13, vertical:5 ),
                                      //   decoration: BoxDecoration(
                                      //     color: Colors.red,
                                      //     borderRadius: BorderRadius.circular(6),
                                      //   ),
                                      //   child: const Text(
                                      //     'READ',
                                      //     style: TextStyle(
                                      //       color: Colors.white,
                                      //       fontWeight: FontWeight.bold,
                                      //       fontSize: 12
                                      //       ),
                                      //   ),
                                      // ),



                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            backgroundColor: Colors.black,
                                            isScrollControlled: true,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                            ),
                                            builder: (_) => BlogDetailPopup(
                                              blog: blog,
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: const Text(
                                            'READ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),



                                      // Icons on right
                                      Row(
                                        children: const [
                                          LikeButton(),
                                          Icon(Icons.comment, size: 17, color: Colors.grey),
                                          SizedBox(width: 12),
                                          Icon(Icons.share, size: 17, color: Colors.grey),
                                          BookmarkButton(),
                                          // SizedBox(width: 12),
                                          // Icon(Icons.more_vert, size: 17, color: Colors.white),
                                        ],
                                      ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                        // Right: Image with read tag and icons
                        Expanded(
                          flex: 2,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  blog['image']!,
                                  height: 140,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              

                              // Icons Row
                              // Positioned(
                              //   bottom: 8,
                              //   left: 8,
                              //   child: Row(
                              //     children: const [
                              //       Icon(Icons.bookmark_border, size: 16, color: Colors.white),
                              //       SizedBox(width: 12),
                              //       Icon(Icons.share, size: 16, color: Colors.white),
                              //       SizedBox(width: 12),
                              //       Icon(Icons.comment, size: 16, color: Colors.white),
                              //       SizedBox(width: 12),
                              //       Icon(Icons.more_vert, size: 16, color: Colors.white),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}























// import 'package:flutter/material.dart';
// import '../widgets/custom_drawer.dart';
// import '../widgets/heading.dart';
// import '../widgets/like_button.dart';
// import '../widgets/bookmark_icon.dart';
// import '../widgets/blog_detail_popup.dart';
// import '../widgets/profile_avatar.dart';
// import '../widgets/shimmer_loading.dart';

// class ExplorePage extends StatefulWidget {
//   const ExplorePage({super.key});

//   @override
//   State<ExplorePage> createState() => _ExplorePageState();
// }

// class _ExplorePageState extends State<ExplorePage> {
//   int selectedIndex = 0;
//   bool _isLoading = true;

//   final List<String> categories = ['You', 'Following', 'Trending'];

//   final List<Map<String, String>> blogs = [
//     {
//       'author': 'Alice',
//       'date': 'May 14, 2025',
//       'title': 'The Future of Tech',
//       'content': 'Explore how AI and quantum computing will shape the next generation...',
//       'image': 'assets/blog1.jpeg',
//     },
//     {
//       'author': 'Bob',
//       'date': 'May 10, 2025',
//       'title': 'Minimalism in Design',
//       'content': 'Discover the beauty of doing more with less in UI/UX trends today...',
//       'image': 'assets/blog2.jpeg',
//     },
//     {
//       'author': 'Charlie',
//       'date': 'May 8, 2025',
//       'title': 'Remote Work Tips',
//       'content': 'Staying productive from home: tips, tools, and mindset shifts...',
//       'image': 'assets/blog3.jpeg',
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 1), () {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).copyWith(
//       scaffoldBackgroundColor: Colors.black,
//       primaryColor: Colors.red,
//       cardColor: Colors.white.withOpacity(0.1),
//     );

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: theme.scaffoldBackgroundColor,
//         title: const Heading(),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 23),
//             child: const ProfileAvatar(radius: 22),
//           ),
//         ],
//       ),
//       drawer: CustomDrawer(theme: theme),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Search bar
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               height: 48,
//               decoration: BoxDecoration(
//                 color: theme.cardColor,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 children: const [
//                   Icon(Icons.search, color: Colors.white70),
//                   SizedBox(width: 12),
//                   Expanded(
//                     child: Text(
//                       'Search blogs...',
//                       style: TextStyle(color: Colors.white70, fontSize: 16),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Category selector
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(categories.length, (index) {
//                 final isSelected = index == selectedIndex;
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() => selectedIndex = index);
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                     decoration: BoxDecoration(
//                       color: isSelected ? theme.primaryColor : theme.cardColor,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       categories[index],
//                       style: TextStyle(
//                         color: isSelected ? Colors.white : Colors.white70,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),

//             const SizedBox(height: 20),

//             // Blog List or Shimmer
//             Expanded(
//               child: _isLoading
//                   ? const ShimmerLoading()
//                   : ListView.builder(
//                       itemCount: blogs.length,
//                       itemBuilder: (context, index) {
//                         final blog = blogs[index];
//                         return Container(
//                           margin: const EdgeInsets.only(bottom: 16),
//                           decoration: BoxDecoration(
//                             color: theme.cardColor,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Row(
//                             children: [
//                               // Blog content
//                               Expanded(
//                                 flex: 4,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text: blog['author'],
//                                               style: const TextStyle(color: Colors.red, fontSize: 12),
//                                             ),
//                                             const TextSpan(
//                                               text: ' • ',
//                                               style: TextStyle(color: Colors.grey, fontSize: 12),
//                                             ),
//                                             TextSpan(
//                                               text: blog['date'],
//                                               style: const TextStyle(color: Colors.grey, fontSize: 12),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       const SizedBox(height: 6),
//                                       Text(
//                                         blog['title'] ?? '',
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 18,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 8),
//                                       Text(
//                                         blog['content'] ?? '',
//                                         style: const TextStyle(color: Colors.white70),
//                                         maxLines: 3,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       const SizedBox(height: 8),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           GestureDetector(
//                                             onTap: () {
//                                               showModalBottomSheet(
//                                                 context: context,
//                                                 backgroundColor: Colors.black,
//                                                 isScrollControlled: true,
//                                                 shape: const RoundedRectangleBorder(
//                                                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                                                 ),
//                                                 builder: (_) => BlogDetailPopup(blog: blog),
//                                               );
//                                             },
//                                             child: Container(
//                                               padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
//                                               decoration: BoxDecoration(
//                                                 color: Colors.red,
//                                                 borderRadius: BorderRadius.circular(6),
//                                               ),
//                                               child: const Text(
//                                                 'READ',
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 12,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Row(
//                                             children: const [
//                                               LikeButton(),
//                                               Icon(Icons.comment, size: 17, color: Colors.grey),
//                                               SizedBox(width: 12),
//                                               Icon(Icons.share, size: 17, color: Colors.grey),
//                                               BookmarkButton(),
//                                             ],
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               // Blog image
//                               Expanded(
//                                 flex: 2,
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.only(
//                                     topRight: Radius.circular(12),
//                                     bottomRight: Radius.circular(12),
//                                   ),
//                                   child: Image.asset(
//                                     blog['image']!,
//                                     height: 140,
//                                     width: double.infinity,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
