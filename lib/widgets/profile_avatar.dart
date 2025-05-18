// import 'package:flutter/material.dart';

// class ProfileAvatar extends StatelessWidget {
//   final double radius;

//   const ProfileAvatar({super.key, this.radius = 40});

//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: radius,
//       backgroundImage: const AssetImage('assets/profile.jpeg'), // Replace with your image path
//     );
//   }
// }












// import 'dart:io';
// import 'package:flutter/material.dart';

// class ProfileAvatar extends StatefulWidget {
//   final double radius;

//   const ProfileAvatar({super.key, this.radius = 40});

//   static File? currentImage;

//   // Global key to access state
//   static final GlobalKey<_ProfileAvatarState> _globalKey = GlobalKey<_ProfileAvatarState>();

//   // Static method to update image
//   static void updateImage(File newImage) {
//     currentImage = newImage;
//     _globalKey.currentState?._refreshImage();
//   }

//   @override
//   State<ProfileAvatar> createState() => _ProfileAvatarState();
// }

// class _ProfileAvatarState extends State<ProfileAvatar> {
//   void _refreshImage() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: widget.radius,
//       backgroundImage: ProfileAvatar.currentImage != null
//           ? FileImage(ProfileAvatar.currentImage!)
//           : const AssetImage('assets/profile.jpeg') as ImageProvider,
//     );
//   }
// }






import 'dart:io';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatefulWidget {
  final double radius;

  const ProfileAvatar({super.key, this.radius = 40});

  static File? _currentImage;
  static final GlobalKey<_ProfileAvatarState> avatarKey = GlobalKey<_ProfileAvatarState>();

  static void updateImage(File image) {
    _currentImage = image;
    avatarKey.currentState?.refresh();
  }

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  void refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.radius,
      backgroundImage: ProfileAvatar._currentImage != null
          ? FileImage(ProfileAvatar._currentImage!)
          : const AssetImage('assets/profile.jpeg') as ImageProvider,
    );
  }
}
