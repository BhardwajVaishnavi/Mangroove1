import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marineapp/Screen/category.dart';
import 'package:marineapp/Component/global.dart' as globals;

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var introTextStyle = GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );

    var subTextStyle = GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );

    var buttonFontStyle = GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: Color(0xff274C77),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );

    var buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xffA3CEF1),
      minimumSize: Size(width * 0.45, height * 0.06),
    );
    ScreenUtil.init(context, designSize: const Size(3840, 2160), minTextAdapt: true);

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;
        return Stack(
          children: [
            // Background image
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0F245A), // Set background color to 0f245a
                image: DecorationImage(
                  image: const AssetImage('assets/images/bg.png'),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.dstATop,
                  ), // Set image opacity to 20%
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Content
            Center(
              child: Column(
                children: [
                  SizedBox(height: height*0.15,),
                  Text(
                    'MARINE WILDLIFE',
                    style: introTextStyle.copyWith(
                      fontSize: 300.sp,  // Scaling font size
                    ),
                  ),
                  Text(
                    'મરીન વાઇલ્ડલાઇફ',
                    style: introTextStyle.copyWith(
                      fontSize: 300.sp,  // Scaling font size
                    ),
                  ),
                  SizedBox(height: 50.h),  // Scaling height dynamically
                  Container(
                    width: screenWidth*0.7,
                    height: screenHeight*0.4,
                    child: SvgPicture.asset(
                      'assets/images/circle.svg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(height: 20.h),  // Scaling height dynamically
                  Text(
                    'Choose language to begin',
                    style: subTextStyle.copyWith(
                      fontSize: 140.sp,  // Scaling font size
                    ),
                  ),
                  Text(
                    'શરૂ કરવા માટે ભાષા પસંદ કરો',
                    style: subTextStyle.copyWith(
                      fontSize: 120.sp,  // Scaling font size
                    ),
                  ),
                  SizedBox(height: 30.h),  // Scaling height dynamically
                  // Language buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: buttonStyle.copyWith(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                              vertical: 16.h,  // Scaling button padding
                              horizontal: 30.w,
                            ),
                          ),
                        ),
                        onPressed: () {
                          globals.selectedLanguage = 'en';
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Category()),
                          );
                        },
                        child: Text(
                          'English',
                          style: buttonFontStyle.copyWith(
                            fontSize: 120.sp,  // Scaling font size
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),  // Scaling width dynamically
                      ElevatedButton(
                        style: buttonStyle.copyWith(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                              vertical: 16.h,  // Scaling button padding
                              horizontal: 30.w,
                            ),
                          ),
                        ),
                        onPressed: () {
                          globals.selectedLanguage = 'gu';
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Category()),
                          );
                        },
                        child: Text(
                          'ગુજરાતી',
                          style: buttonFontStyle.copyWith(
                            fontSize: 120.sp,  // Scaling font size
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );}
      ),
    );
  }
}
