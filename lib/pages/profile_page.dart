








// import 'package:flutter/material.dart';
// import 'package:meblogs/pages/NewBlogPage.dart';
// import 'package:meblogs/pages/comments.dart';
// import 'package:meblogs/pages/setting_page.dart';
// import 'package:meblogs/pages/your_blogs.dart';
// import 'package:meblogs/widgets/custom_drawer.dart';
// import 'package:meblogs/widgets/avator_popup.dart';
// import 'package:meblogs/widgets/heading.dart';
// import 'package:meblogs/pages/editProfile_page.dart';
// import 'package:meblogs/widgets/profile_avatar.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   int _currentIndex = -1; // Start with nothing selected

//   final List<Widget> _pages = [
//     Center(child: Text('New Post', style: TextStyle(color: Colors.white))),
//     Center(child: Text('Your Blogs', style: TextStyle(color: Colors.white))),
//     Center(child: Text('Comments', style: TextStyle(color: Colors.white))),
//     Center(child: Text('Settings', style: TextStyle(color: Colors.white))),
//   ];

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
//             child: Builder(
//               builder: (context) {
//                 OverlayEntry? overlayEntry;

//                 void showOverlay(TapDownDetails details) {
//                   final overlay = Overlay.of(context);
//                   final tapPosition = details.globalPosition;

//                   overlayEntry = OverlayEntry(
//                     builder: (context) => Positioned(
//                       top: tapPosition.dy + 10,
//                       left: tapPosition.dx - 150,
//                       width: 200,
//                       child: Material(
//                         color: Colors.transparent,
//                         child: ProfilePopup(
//                           onDismiss: () {
//                             overlayEntry?.remove();
//                             overlayEntry = null;
//                           },
//                         ),
//                       ),
//                     ),
//                   );
//                   overlay.insert(overlayEntry!);
//                 }

//                 return GestureDetector(
//                   onTapDown: showOverlay,
//                   child: const ProfileAvatar(  // Replaced CircleAvatar with your custom widget
//                     radius: 22,                // Pass your desired radius here
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       drawer: CustomDrawer(theme: theme),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Profile header
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text("Portfolio",
//                     style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white)),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     ProfileAvatar(key: ProfileAvatar.avatarKey, radius: 50),
//                     const SizedBox(width: 20),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text("John Doe",
//                             style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white)),
//                         Text("john@example.com",
//                             style:
//                                 TextStyle(fontSize: 16, color: Colors.grey[400])),
//                         const SizedBox(height: 8),
//                         Text("Mobile app developer",
//                             style: TextStyle(color: Colors.grey[500])),
//                         const SizedBox(height: 12),
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfilePage()));

//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red,
//                           ),
//                           child: const Text('Edit Profile',
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),

//           // Show selected page only when index is valid
//           if (_currentIndex != -1) Expanded(child: _pages[_currentIndex]),
//         ],
//       ),

//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.grey[900],
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.grey,
//         currentIndex: _currentIndex == -1 ? 0 : _currentIndex,
//         onTap: (int index) {
//           // Navigate to respective page
//           switch (index) {
//             case 0:
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (_) => NewBlogPage()));
//               break;
//             case 1:
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (_) => YourBlogs()));
//               break;
//             case 2:
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (_) => Comments()));
//               break;
//             case 3:
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (_) => SettingPage()));
//               break;
//           }
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//               decoration: BoxDecoration(
//                 color: (_currentIndex == 0)
//                     ? Colors.red.withOpacity(0.2)
//                     : Colors.transparent,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(
//                 Icons.create,
//                 color: (_currentIndex == 0) ? Colors.red : Colors.grey,
//               ),
//             ),
//             label: 'New Post',
//           ),
//           BottomNavigationBarItem(
//             icon: AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//               decoration: BoxDecoration(
//                 color: (_currentIndex == 1)
//                     ? Colors.red.withOpacity(0.2)
//                     : Colors.transparent,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(
//                 Icons.library_books,
//                 color: (_currentIndex == 1) ? Colors.red : Colors.grey,
//               ),
//             ),
//             label: 'Your Blogs',
//           ),
//           BottomNavigationBarItem(
//             icon: AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//               decoration: BoxDecoration(
//                 color: (_currentIndex == 2)
//                     ? Colors.red.withOpacity(0.2)
//                     : Colors.transparent,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(
//                 Icons.comment,
//                 color: (_currentIndex == 2) ? Colors.red : Colors.grey,
//               ),
//             ),
//             label: 'Comments',
//           ),
//           BottomNavigationBarItem(
//             icon: AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//               decoration: BoxDecoration(
//                 color: (_currentIndex == 3)
//                     ? Colors.red.withOpacity(0.2)
//                     : Colors.transparent,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(
//                 Icons.settings,
//                 color: (_currentIndex == 3) ? Colors.red : Colors.grey,
//               ),
//             ),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }































import 'package:flutter/material.dart';
import 'package:meblogs/pages/NewBlogPage.dart';
import 'package:meblogs/pages/comments.dart';
import 'package:meblogs/pages/setting_page.dart';
import 'package:meblogs/pages/your_blogs.dart';
import 'package:meblogs/widgets/custom_drawer.dart';
import 'package:meblogs/widgets/avator_popup.dart';
import 'package:meblogs/widgets/heading.dart';
import 'package:meblogs/pages/editProfile_page.dart';
import 'package:meblogs/widgets/profile_avatar.dart';

import '../widgets/user_profile.dart';  // import UserProfile

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = -1;

  final List<Widget> _pages = [
    Center(child: Text('New Post', style: TextStyle(color: Colors.white))),
    Center(child: Text('Your Blogs', style: TextStyle(color: Colors.white))),
    Center(child: Text('Comments', style: TextStyle(color: Colors.white))),
    Center(child: Text('Settings', style: TextStyle(color: Colors.white))),
  ];

  final UserProfile _user = UserProfile();

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
                      top: tapPosition.dy + 10,
                      left: tapPosition.dx - 150,
                      width: 200,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Portfolio",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ProfileAvatar(key: ProfileAvatar.avatarKey, radius: 50),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _user.name,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          _user.email,
                          style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _user.bio,
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () async {
                            // Navigate and await result, then refresh UI
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EditProfilePage(),
                              ),
                            );
                            setState(() {}); // Refresh UI with updated data
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Edit Profile',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),

          if (_currentIndex != -1) Expanded(child: _pages[_currentIndex]),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex == -1 ? 0 : _currentIndex,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => NewBlogPage()));
              break;
            case 1:
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => YourBlogs()));
              break;
            case 2:
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Comments()));
              break;
            case 3:
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SettingPage()));
              break;
          }
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color: (_currentIndex == 0)
                    ? Colors.red.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.create,
                color: (_currentIndex == 0) ? Colors.red : Colors.grey,
              ),
            ),
            label: 'New Post',
          ),
          BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color: (_currentIndex == 1)
                    ? Colors.red.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.library_books,
                color: (_currentIndex == 1) ? Colors.red : Colors.grey,
              ),
            ),
            label: 'Your Blogs',
          ),
          BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color: (_currentIndex == 2)
                    ? Colors.red.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.comment,
                color: (_currentIndex == 2) ? Colors.red : Colors.grey,
              ),
            ),
            label: 'Comments',
          ),
          BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color: (_currentIndex == 3)
                    ? Colors.red.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.settings,
                color: (_currentIndex == 3) ? Colors.red : Colors.grey,
              ),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
