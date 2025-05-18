







// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import '../widgets/profile_avatar.dart';

// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({super.key});

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _bioController = TextEditingController();
//   final TextEditingController _instagramController = TextEditingController();
//   final TextEditingController _linkedinController = TextEditingController();
//   final TextEditingController _githubController = TextEditingController();
//   final TextEditingController _twitterController = TextEditingController();

//   void _cancel() {
//     Navigator.pop(context);
//   }

//   void _saveChanges() {
//     if (_formKey.currentState!.validate()) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Changes saved successfully!')),
//       );
//       Navigator.pop(context);
//     }
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _bioController.dispose();
//     _instagramController.dispose();
//     _linkedinController.dispose();
//     _githubController.dispose();
//     _twitterController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final inputDecoration = InputDecoration(
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//       contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile'),
//         backgroundColor: Colors.black,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 35),
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             ProfileAvatar(key: ProfileAvatar.avatarKey, radius: 50),
//                             Positioned(
//                               bottom: 4,
//                               right: 4,
//                               child: GestureDetector(
//                                 onTap: () async {
//                                   FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
//                                   if (result != null && result.files.single.path != null) {
//                                     File newImage = File(result.files.single.path!);
//                                     ProfileAvatar.updateImage(newImage); // update globally
//                                   }
//                                 },
//                                 child: Container(
//                                   decoration: const BoxDecoration(
//                                     color: Colors.black,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   padding: const EdgeInsets.all(4),
//                                   child: const Icon(Icons.edit, size: 20, color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 6),
//                           TextFormField(
//                             controller: _nameController,
//                             decoration: inputDecoration.copyWith(hintText: 'Enter your name'),
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty) {
//                                 return 'Please enter your name';
//                               }
//                               return null;
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 16),

//                 const Text('Bio', style: TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 6),
//                 TextFormField(
//                   controller: _bioController,
//                   decoration: inputDecoration.copyWith(hintText: 'Mobile app developer'),
//                   maxLines: 3,
//                 ),

//                 const SizedBox(height: 24),

//                 const Divider(thickness: 1),

//                 const SizedBox(height: 16),

//                 const Text('Social Links', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

//                 const SizedBox(height: 16),

//                 Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text('Instagram', style: TextStyle(fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 6),
//                           TextFormField(
//                             controller: _instagramController,
//                             decoration: inputDecoration,
//                             keyboardType: TextInputType.url,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text('LinkedIn', style: TextStyle(fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 6),
//                           TextFormField(
//                             controller: _linkedinController,
//                             decoration: inputDecoration,
//                             keyboardType: TextInputType.url,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 16),

//                 Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text('GitHub', style: TextStyle(fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 6),
//                           TextFormField(
//                             controller: _githubController,
//                             decoration: inputDecoration,
//                             keyboardType: TextInputType.url,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text('Twitter', style: TextStyle(fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 6),
//                           TextFormField(
//                             controller: _twitterController,
//                             decoration: inputDecoration,
//                             keyboardType: TextInputType.url,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         color: Colors.black,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             ElevatedButton(
//               onPressed: _cancel,
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
//               child: const Text('Cancel', style: TextStyle(color: Colors.black)),
//             ),
//             const SizedBox(width: 16),
//             ElevatedButton(
//               onPressed: _saveChanges,
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//               child: const Text('Save Changes', style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





































import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/user_profile.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  final TextEditingController _twitterController = TextEditingController();

  final UserProfile _user = UserProfile();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with current profile data
    _nameController.text = _user.name;
    _emailController.text = _user.email;
    _bioController.text = _user.bio;
    _instagramController.text = _user.instagram;
    _linkedinController.text = _user.linkedin;
    _githubController.text = _user.github;
    _twitterController.text = _user.twitter;
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      // Update shared user profile instance
      _user.name = _nameController.text.trim();
      _user.email = _emailController.text.trim();
      _user.bio = _bioController.text.trim();
      _user.instagram = _instagramController.text.trim();
      _user.linkedin = _linkedinController.text.trim();
      _user.github = _githubController.text.trim();
      _user.twitter = _twitterController.text.trim();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Changes saved successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    _instagramController.dispose();
    _linkedinController.dispose();
    _githubController.dispose();
    _twitterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 35),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ProfileAvatar(key: ProfileAvatar.avatarKey, radius: 50),
                            Positioned(
                              bottom: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: () async {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
                                  if (result != null && result.files.single.path != null) {
                                    final path = result.files.single.path!;
                                    ProfileAvatar.updateImage(File(path));
                                    setState(() {}); // Refresh to show new image
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.edit, size: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Name
                TextFormField(
                  controller: _nameController,
                  decoration: inputDecoration.copyWith(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Email
                TextFormField(
                  controller: _emailController,
                  decoration: inputDecoration.copyWith(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Bio
                TextFormField(
                  controller: _bioController,
                  decoration: inputDecoration.copyWith(labelText: 'Bio'),
                  maxLines: 3,
                ),
                const SizedBox(height: 20),

                // Social links - optional, can add validation if desired
                TextFormField(
                  controller: _instagramController,
                  decoration: inputDecoration.copyWith(labelText: 'Instagram'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _linkedinController,
                  decoration: inputDecoration.copyWith(labelText: 'LinkedIn'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _githubController,
                  decoration: inputDecoration.copyWith(labelText: 'GitHub'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _twitterController,
                  decoration: inputDecoration.copyWith(labelText: 'Twitter'),
                ),
                const SizedBox(height: 30),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: _cancel,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: _saveChanges,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Save Changes', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
