// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:meblogs/widgets/heading.dart';

// class SignupPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();

//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     // super.dispose();
//   }

//   Future<void> createUserWithEmailAndPassword() async{
//     try {
//       final UserCredential =  await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//       );
//     print(UserCredential.user?.uid);
//     // Add user to Firestore
      
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
//                 Text("Create Account", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 20),
//                 TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     hintText: "Full Name",
//                     filled: true,
//                     fillColor: Colors.grey[900],
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                   ),
//                 ),

//                 SizedBox(height: 16),
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
//                   onPressed: () async{
//                     await createUserWithEmailAndPassword();
//                   },
//                   child: Text("Sign Up"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     minimumSize: Size(double.infinity, 50),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 TextButton(
//                   onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
//                   child: Text("Already have an account? Sign In"),
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
import 'package:meblogs/widgets/heading.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Show success snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Account created successfully!"),
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 20),
        ),
      );

      print("User created: ${userCredential.user?.uid}");

      // Wait for snackbar to be visible, then navigate
      await Future.delayed(Duration(milliseconds: 20));
      Navigator.pushReplacementNamed(context, '/home');

    } on FirebaseAuthException catch (e) {
      // Show error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Something went wrong"),
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
                Text(
                  "Create Account",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 16),
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
                  onPressed: createUserWithEmailAndPassword,
                  child: Text("Sign Up"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                  child: Text("Already have an account? Sign In"),
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
