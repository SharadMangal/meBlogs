// import 'package:flutter/material.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:meblogs/pages/explore_page.dart';
// import 'NewBlogPage.dart';
// import '../widgets/custom_drawer.dart';
// import '../widgets/heading.dart';


// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).copyWith(
//       scaffoldBackgroundColor: Colors.black,
//       primaryColor: Colors.red,
//       cardColor: Colors.white.withOpacity(0.1),
//       textTheme: TextTheme(
//         headlineMedium: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
//         bodyMedium: const TextStyle(color: Colors.white70, fontSize: 18),
//         titleMedium: const TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
//         titleSmall: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         bodySmall: const TextStyle(color: Colors.grey),
//       ),
//     );

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,


//       appBar: AppBar(
//   backgroundColor: theme.scaffoldBackgroundColor,
//   iconTheme: IconThemeData(color: Colors.white),
//   // title: const Text('meBlogs', style: TextStyle(color: Colors.white)),
//   title: const Heading(),  // use your custom widget here
// ),


//     // Custom Drawer
//       drawer: CustomDrawer(theme: theme), 



//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           double horizontalPadding = constraints.maxWidth > 800 ? 60.0 : 20.0;

//           return SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Header
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 80),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('We help you', style: theme.textTheme.headlineMedium),
//                       RichText(
//                         text: TextSpan(
//                           style: theme.textTheme.headlineMedium,
//                           children: [
//                             const TextSpan(text: ' '),
//                             TextSpan(
//                               text: 'write',
//                               style: TextStyle(
//                                 backgroundColor: theme.primaryColor,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             const TextSpan(text: ' & share your stories.'),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Text('Create, publish, and inspire with the most elegant blogging platform.', style: theme.textTheme.bodyMedium),
//                       const SizedBox(height: 30),
//                       Row(
//                         children: [
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.red,
//                               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                             ),
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => const NewBlogPage()),
//                               );
//                             },
//                             child: const Text('Start Writing', style: TextStyle(color: Colors.white)),
//                           ),
//                           const SizedBox(width: 20),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white,
//                               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                             ),
//                             onPressed: () {
//                               // Navigator.pushNamed(context, '/explore');
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => const ExplorePage()),
//                               );
//                             },
//                             child: const Text(
//                               'Explore',
//                               style: TextStyle(
//                                 color: Colors.red,
//                                 fontWeight: FontWeight.bold,)),

//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 40),

//                 // Blog Section
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Latest Releases', style: theme.textTheme.titleMedium),
//                       const SizedBox(height: 20),
//                       ...[
//                         {
//                           'date': 'May 2',
//                           'title': 'Summer Vacation - Freedom... For Now'
//                         },
//                         {
//                           'date': 'April 29',
//                           'title': 'Exam Day - Good Luck, Soldier'
//                         },
//                         {
//                           'date': 'April 22',
//                           'title': 'Preparation Day - The Panic Begins'
//                         },
//                       ].map(
//                         (blog) => Card(
//                           color: theme.cardColor,
//                           margin: const EdgeInsets.only(bottom: 20),
//                           child: ListTile(
//                             title: Text(
//                               blog['title']!,
//                               style: theme.textTheme.titleSmall,
//                             ),
//                             subtitle: Text(blog['date']!, style: const TextStyle(color: Colors.white)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }




























import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meblogs/pages/explore_page.dart';
import 'NewBlogPage.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/heading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.red,
      cardColor: Colors.white.withOpacity(0.1),
      textTheme: TextTheme(
        headlineMedium: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
        bodyMedium: const TextStyle(color: Colors.white70, fontSize: 18),
        titleMedium: const TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
        titleSmall: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        bodySmall: const TextStyle(color: Colors.grey),
      ),
    );

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Heading(),
      ),
      drawer: CustomDrawer(theme: theme),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double horizontalPadding = constraints.maxWidth > 800 ? 60.0 : 20.0;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('We help you', style: theme.textTheme.headlineMedium),
                      RichText(
                        text: TextSpan(
                          style: theme.textTheme.headlineMedium,
                          children: [
                            const TextSpan(text: ' '),
                            TextSpan(
                              text: 'write',
                              style: TextStyle(
                                backgroundColor: theme.primaryColor,
                                color: Colors.white,
                              ),
                            ),
                            const TextSpan(text: ' & share your stories.'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text('Create, publish, and inspire with the most elegant blogging platform.', style: theme.textTheme.bodyMedium),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            ),
                            onPressed: () {
                              final user = FirebaseAuth.instance.currentUser;
                              if (user != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const NewBlogPage()),
                                );
                              } else {
                                Navigator.pushNamed(context, '/signup');
                              }
                            },
                            child: const Text('Start Writing', style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            ),
                            onPressed: () {
                              final user = FirebaseAuth.instance.currentUser;
                              if (user != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ExplorePage()),
                                );
                              } else {
                                Navigator.pushNamed(context, '/signup');
                              }
                            },
                            child: const Text(
                              'Explore',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Blog Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Latest Releases', style: theme.textTheme.titleMedium),
                      const SizedBox(height: 20),
                      ...[
                        {
                          'date': 'May 2',
                          'title': 'Summer Vacation - Freedom... For Now'
                        },
                        {
                          'date': 'April 29',
                          'title': 'Exam Day - Good Luck, Soldier'
                        },
                        {
                          'date': 'April 22',
                          'title': 'Preparation Day - The Panic Begins'
                        },
                      ].map(
                        (blog) => Card(
                          color: theme.cardColor,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: ListTile(
                            title: Text(
                              blog['title']!,
                              style: theme.textTheme.titleSmall,
                            ),
                            subtitle: Text(blog['date']!, style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
