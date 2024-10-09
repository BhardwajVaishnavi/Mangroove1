// import 'package:flutter/material.dart';
//
// class ArchClipper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0,size.height*0.85);
//
//     path.quadraticBezierTo(size.width/2, size.height, size.width, size.height*0.85);
//
//     path.lineTo(size.width, 0);
//
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
//
// }
library my_project.globals;

String selectedLanguage = 'en'; // Default language is English