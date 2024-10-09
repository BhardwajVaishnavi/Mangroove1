import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'category.dart'; // Import the Category page
import 'package:marineapp/Component/global.dart' as globals;
import 'package:carousel_slider/carousel_slider.dart';

class MarineScreen extends StatefulWidget {
  @override
  _MarineScreenState createState() => _MarineScreenState();
}

class _MarineScreenState extends State<MarineScreen> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0; // Current index of the carousel
  final List<String> _carouselImages = [
    'assets/images/new-image/dolphines.jpg',
    'assets/images/new-image/dolphines.jpg',
    'assets/images/new-image/dolphines.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return ScreenUtilInit(
      designSize: const Size(3840, 2160), // Maintain a standard design size
      builder: (context, child) {
        return Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              var height = constraints.maxHeight;
              var width = constraints.maxWidth;
              // Use ScreenUtil to scale font size, padding, and widths
              double scaleFont(double fontSize) {
                return fontSize
                    .sp; // Use 'sp' to scale font sizes based on screen size
              }

              double scalePadding(double padding) {
                return padding
                    .w; // Use 'w' to scale widths and paddings based on screen width
              }
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth, // Ensure it covers full width
                  minHeight: constraints
                      .maxHeight, // Ensure it covers full height
                ),
                child: Container(
                  color: const Color(0xFF6096BA),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Header Section
                      Expanded(
                        flex: 5,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0, (height * 0.12), 0, 0),
                                    child: CarouselSlider(
                                      items: _carouselImages.map((i) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return Container(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              decoration: const BoxDecoration(
                                              ),
                                              child: Image.asset(
                                                i,
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                              ),
                                            );
                                          },
                                        );
                                      }).toList(),
                                      carouselController: _carouselController,
                                      options: CarouselOptions(
                                        height: height * 0.7,
                                        // Responsive height
                                        autoPlay: false,
                                        enableInfiniteScroll: true,
                                        enlargeCenterPage: true,
                                        viewportFraction: 1.0,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            _currentIndex =
                                                index; // Update the current index
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -50.h,
                              child: Stack(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/top.svg',
                                    width: width,
                                    // Dynamically set width based on screen size
                                    fit: BoxFit
                                        .cover, // Ensure the SVG scales to fit the width
                                  ),
                                  Positioned(
                                    top: 120.h,
                                    left: 50.w,
                                    child: Container(
                                      margin: EdgeInsets.only(left: width*0.04),
                                      child: Text(
                                        globals.selectedLanguage == 'en'
                                            ? "MARINE WILDLIFE"
                                            : "મરીન વન્યજીવન",
                                        style: TextStyle(
                                          color: const Color(0xFFF5F5F5),
                                          fontSize: 200.sp,
                                          // Responsive font size
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 700.h,
                              left: 10,
                              child: IconButton(
                                onPressed: () {
                                  if (_currentIndex > 0) {
                                    _carouselController.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: width > 600 ? 100 : 20,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 700.h,
                              right: 10,
                              child: IconButton(
                                onPressed: () {
                                  if (_currentIndex <
                                      _carouselImages.length - 1) {
                                    _carouselController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: width > 600 ? 100 : 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Information Section
                      Container(
                        height: 0.09.sh, // Responsive height
                        width: double.infinity,
                        color: const Color(0xFF274C77),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(75.w, 25.h, 0, 0),
                              child: Container(
                                margin: EdgeInsets.only(left: width*0.035),
                                child: Text(
                                  globals.selectedLanguage == 'en'
                                      ? 'FINLESS PORPOISE'
                                      : 'ફિનલેસ પોર્પોઈસ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 120.sp, // Responsive font size
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(75.w, 15.h, 0, 0),
                              child: Container(
                                margin: EdgeInsets.only(left: width*0.035),
                                child: Text(
                                  globals.selectedLanguage == 'en'
                                      ? 'Neophocaena phocaenoides'
                                      : 'નેઓફોસેના ફોસેનોઇડ્સ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 100.sp, // Responsive font size
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Scrollable Content Section
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Expanded(
                              child: RawScrollbar(
                                controller: _scrollController,
                                padding: EdgeInsets.only(right: width * 0.08,top: height*0.02),
                                thumbVisibility: true,
                                thickness: 20.0,
                                trackVisibility: true,
                                thumbColor: Colors.white,
                                trackColor: const Color(0x99685543),
                                trackRadius: const Radius.circular(20.0),
                                radius: const Radius.circular(20.0),
                                scrollbarOrientation: ScrollbarOrientation
                                    .right,
                                child: SingleChildScrollView(
                                  controller: _scrollController,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: width * 0.1,
                                        top: width * 0.02,
                                        left: width * 0.02),
                                    child: Container(
                                      margin: EdgeInsets.only(left: width*0.03,right: width*0.05),
                                      child: Text(
                                        globals.selectedLanguage == 'en'
                                            ? "What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
                                            : 'લોરેમ ઇપ્સમ...',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 150.sp,
                                          // Responsive font size
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildScrollButton(
                                    _scrollController,
                                    Icons.arrow_upward_rounded,
                                    -100
                                ),
                                SizedBox(height: 5.h),
                                _buildScrollButton(
                                    _scrollController,
                                    Icons.arrow_downward_rounded,
                                    100
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Back Button
                      Padding(
                        padding: EdgeInsets.fromLTRB(0,
                            height * 0.02, width * 0.02, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: height * 0.05,
                                width: width * 0.07,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(60, 80)),
                                ),
                                // padding: EdgeInsets.symmetric(
                                //   horizontal: scalePadding(10.0),
                                //   vertical: scalePadding(13.0),
                                // ),
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(pi),
                                  child: Icon(
                                    Icons.exit_to_app_outlined,
                                    color: const Color(0xFF274C77),
                                    size:
                                    scaleFont(120.0), // Scale icon size
                                  ),
                                ),
                              ),
                              Text(
                                'Back',
                                style: TextStyle(
                                  color: const Color(0xFFEFEFEF),
                                  fontSize: scaleFont(75),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

// Widget to build scroll buttons
Widget _buildScrollButton(ScrollController controller, IconData icon, double offset) {
  return Padding(
    padding:  EdgeInsets.only(right: 30.w),
    child: Container(
      height: 100.h,
      decoration: BoxDecoration(
          color: const Color(0x99685543),
        borderRadius: BorderRadius.circular(12)
      ),
      child: IconButton(onPressed: (){
        controller.animateTo(
            controller.offset + offset,
            duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);}, icon: Icon(icon, color: const Color(0xFFEFEFEF)),iconSize: 50.h,),
    ),
  );
}

// // Widget for the back button
// Widget _buildBackButton(BuildContext context,var height,var width) {
//   return Padding(
//     padding: EdgeInsets.fromLTRB(0,
//         height * 0.02, scalePadding(width * 0.15), 0),
//     child: GestureDetector(
//       onTap: () {
//         Navigator.pop(context);
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: height * 0.05,
//             width: width * 0.07,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.all(
//                   Radius.elliptical(60, 80)),
//             ),
//             // padding: EdgeInsets.symmetric(
//             //   horizontal: scalePadding(10.0),
//             //   vertical: scalePadding(13.0),
//             // ),
//             child: Transform(
//               alignment: Alignment.center,
//               transform: Matrix4.rotationY(pi),
//               child: Icon(
//                 Icons.exit_to_app_outlined,
//                 color: const Color(0xFF274C77),
//                 size:
//                 scaleFont(120.0), // Scale icon size
//               ),
//             ),
//           ),
//           Text(
//             'Back',
//             style: TextStyle(
//               color: const Color(0xFFEFEFEF),
//               fontSize: scaleFont(75),
//               fontFamily: 'Poppins',
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
  }

