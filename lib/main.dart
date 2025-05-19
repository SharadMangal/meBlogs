// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:meblogs/firebase_options.dart';
// import 'pages/login_page.dart';
// import 'pages/signup_page.dart';
// import 'pages/home_page.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//     );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//   title: 'meBlogs',
//   debugShowCheckedModeBanner: false,
//   theme: ThemeData.dark(useMaterial3: true).copyWith(
//     scaffoldBackgroundColor: const Color(0xFF121212), // Custom background color
//     primaryColor: Colors.red, // Primary color for app elements (buttons, etc.)
//     textTheme: const TextTheme(
//       bodyMedium: TextStyle(color: Colors.white), // Text color for body
//     ),
//   ),
//       initialRoute: '/signup',
//       routes: {
//         '/signup': (context) => SignupPage(),
//         '/login': (context) => LoginPage(),
//         '/home': (context) => const HomePage(),
//       },
//     );
//   }
// }













import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pages/home_page.dart';
import 'pages/signup_page.dart';
import 'pages/login_page.dart';
import 'firebase_options.dart'; // This is auto-generated

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(); // Ensure Firebase is initialized
//   runApp(
//     DevicePreview(
//       enabled: true,
//       builder: (context) => MyApp(),
//     ),
//   );

// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true, // 🛠 REQUIRED for DevicePreview
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      title: 'meBlogs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: AuthWrapper(),
      routes: {
        '/signup': (context) => SignupPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return SignupPage(); // Or LoginPage if you prefer
        }
      },
    );
  }
}
