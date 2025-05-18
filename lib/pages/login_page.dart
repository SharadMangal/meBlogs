// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../widgets/heading.dart';

// class LoginPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();


//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//   }

//   Future<void> signInWithEmailAndPassword() async {
//     try {
//       final UserCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//       print(UserCredential);
//     } on FirebaseAuthException catch (e) {
//       print(e.message);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Heading(),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Text("Welcome Back", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 20),
//                 TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     hintText: "Email",
//                     filled: true,
//                     fillColor: Colors.grey[900],
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 TextField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: "Password",
//                     filled: true,
//                     fillColor: Colors.grey[900],
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                   ),
//                 ),
//                 SizedBox(height: 24),
//                 ElevatedButton(
//                   onPressed: () async {
//                     await signInWithEmailAndPassword();
//                   },
//                   child: Text("Sign In"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     minimumSize: Size(double.infinity, 50),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 TextButton(
//                   onPressed: () => Navigator.pushReplacementNamed(context, '/signup'),
//                   child: Text("Don't have an account? Sign Up"),
//                 ),
//                 TextButton(
//                   onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
//                   child: Text("Skip"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






















import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:meblogs/pages/home_page.dart';
// import 'package:meblogs/pages/signup_page.dart';
import '../widgets/heading.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Show success snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login successful!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      print("Signed in: ${userCredential.user?.uid}");

      // Wait to let snackbar be visible before navigating
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, '/home');

    } on FirebaseAuthException catch (e) {
      // Show error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Login failed"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Heading(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Welcome Back", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 24),

                ElevatedButton(
                  onPressed: signInWithEmailAndPassword,
                  child: Text("Sign In"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),

                SizedBox(height: 16),

                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/signup'),
                  child: Text("Don't have an account? Sign Up"),
                ),

                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                  child: Text("Skip"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
