import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'welcome.dart';
import 'marine.dart';
import 'intro.dart';
import 'package:marineapp/Component/global.dart' as globals;

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final CarouselSliderController _carouselController =
  CarouselSliderController();
  int _currentIndex = 0; // To track the current index of the carousel

  // Categories data
  final List<Map<String, String>> categories = [
    {
      'image': 'assets/images/new-image/dolphines.jpg',
      'name': 'HUMPBACK DOLPHIN',
      'name_gu': 'હમ્પબેક ડોલ્ફિન'
    },
    {
      'image': 'assets/images/new-image/porpoise-2-min.jpg',
      'name': 'FINLESS PORPOISE',
      'name_gu': 'ફિનલેસ્સ પોર્પોઈસે'
    },
    {
      'image': 'assets/images/new-image/blue-whale.jpg',
      'name': 'BLUE WHALE',
      'name_gu': 'બ્લુ વ્હેલ'
    },
    {
      'image': 'assets/images/new-image/killer-whales.jpg',
      'name': 'KILLER WHALE',
      'name_gu': 'કિલર વ્હેલ'
    },
    {
      'image': 'assets/images/new-image/greensea-turtle.jpg',
      'name': 'Green Sea Turtle',
      'name_gu': 'ગ્રીન સી ટર્ટલ'
    },
    {
      'image': 'assets/images/new-image/olive-ridley.jpg',
      'name': 'Oliver Ridlley Turtle',
      'name_gu': 'ઓલિવ રિડલી ટર્ટલ'
    },
    // {
    //   'image': 'assets/images/new-image/Malabar-sea-snake.jpg',
    //   'name': 'MALABAR SNAKE',
    //   'name_gu': 'મલાબાર સ્નેક'
    // },
    // {
    //   'image': 'assets/images/new-image/annulated_sea-snake.jpg',
    //   'name': 'ANNULATED',
    //   'name_gu': 'એન્યુલેટેડ'
    // },
    {
      'image': 'assets/images/new-image/yellow-bellied-snake.jpg',
      'name': 'SEA SNAKE',
      'name_gu': 'દરિયાઈ સાપ'
    },
    // {
    //   'image': 'assets/images/new-image/Hook-nosed-sea-snake.jpg',
    //   'name': 'HOOK-NOSED',
    //   'name_gu': 'હૂક-નોઝડ'
    // },
    {
      'image': 'assets/images/new-image/offshoregulls.jpg',
      'name': 'OFFSHORE GULLS',
      'name_gu': 'ઓફશોર ગલ્સ'
    },
    {
      'image': 'assets/images/new-image/offshore_steppegulls.webp',
      'name': 'SHOREBIRDS',
      'name_gu': 'શોરબર્ડ્સ'
    },
    {
      'image':'assets/images/new-image/whale1.jpg',
      'name': 'WHALE SHARK',
      'name_gu': 'વ્હેલ શાર્ક'
    },
  ];

  // Total number of carousel items, calculated based on the number of categories
  int get totalItems => (categories.length / 4).ceil();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

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
        fontSize: 12,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          var height = constraints.maxHeight;
          var width = constraints.maxWidth;

          // Check if it's a large screen (e.g., desktop or high-res screen)
          bool isLargeScreen = width >= 1080;

          // Calculate the item size based on screen width and the desired 2x2 grid
          double itemWidth = (width - 3 * 16) /
              2; // 2 items per row with 16px padding
          double itemHeight = (height * 0.5 - 3 * 16) /
              2; // 2 items per column with 16px padding

          return Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              color: Color(0xff163666),
              image: DecorationImage(
                image: AssetImage("assets/images/SecondScreenbg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: ClipRect(
                    child: Container(
                      height: height * (isLargeScreen ? 0.18 : 0.25),
                      // Adjusted header height
                      width: width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        color: Color(0xea29558a),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MarineScreen(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * (isLargeScreen ? 0.03 : 0.1),
                            ),
                            Text(
                              globals.selectedLanguage == 'en'
                                  ? "MARINE WILDLIFE"
                                  : "મરીન વન્યજીવન",
                              style: introTextStyle.copyWith(
                                fontSize: width * 0.07, // Scalable font size
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:width*0.1 , vertical: 5),
                              child: Text(
                                globals.selectedLanguage == 'en'
                                    ? "Beneath the surface of the ocean lies a hidden universe filled with extraordinary creatures and breathtaking beauty."
                                    : "સમુદ્રની સપાટીની નીચે અસાધારણ જીવો અને આકર્ષક સુંદરતાથી ભરેલું છુપાયેલ બ્રહ્માંડ છે.",
                                style: subTextStyle.copyWith(
                                  fontSize: width * 0.03, // Scalable font size
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CarouselSlider(
                        carouselController: _carouselController,
                        options: CarouselOptions(
                          disableCenter: true,
                          height: height * (isLargeScreen ? 0.4 : 0.5),
                          // Reduced height for carousel container
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          autoPlay: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        items: List.generate(totalItems, (i) {
                          return Builder(
                            builder: (BuildContext context) {
                              var items = categories.sublist(
                                i * 4, // 2x2 grid per page
                                (i * 4 + 4) > categories.length
                                    ? categories.length
                                    : (i * 4 + 4),
                              );
                              return GridView.builder(
                                itemCount: items.length,
                                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // 2 columns
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                  mainAxisExtent: height * (isLargeScreen ? 0.18: 0.5),
                                ),
                                // shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var category = items[index];
                                  return _gridView(
                                      category['image']!,
                                      globals.selectedLanguage == 'en'
                                          ? category['name']!
                                          : category['name_gu']!,
                                      width,
                                      height,
                                      isLargeScreen
                                  );
                                },
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Positioned(
                        left: 10,
                        child: IconButton(
                          onPressed: () {
                            _carouselController.previousPage();
                            if (_currentIndex > 0) {
                              _carouselController.previousPage();
                            }
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: isLargeScreen
                                ? 100
                                : 20, // Adjusted arrow icon size
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        child: IconButton(
                          onPressed: () {
                            _carouselController.nextPage();
                            if (_currentIndex < totalItems - 1) {
                              _carouselController.nextPage();
                            }
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: isLargeScreen
                                ? 100
                                : 20, // Adjusted arrow icon size
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: isLargeScreen ? height * 0.01 : 5),
                // Adjusted space
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 0),
                  child: Text(
                    globals.selectedLanguage == 'en'
                        ? "Click on the image to know more"
                        : "વધુ જાણવા માટે છબી પર ક્લિક કરો",
                    style: subTextStyle.copyWith(
                      fontSize: width * 0.03, // Adjusted font size
                    ),
                  ),
                ),
                SizedBox(height: isLargeScreen ? height * 0.05 : 5),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            const IntroductionPage()),
                      );
                    },
                    child: Icon(
                      Icons.home,
                      size: isLargeScreen ? 120 : 60, // Adjusted home icon size
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: isLargeScreen ? height * 0.05 : 5),
              ],
            ),
          );
        },
      ),
    );
  }

// Helper method to build the grid view for each category
    Widget _gridView(String image, String title, double width, double height, bool isLargeScreen) {
      var subTextStyle = GoogleFonts.poppins(
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: width * 0.03, // Scalable font size for all screens
        ),
      );

      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IntroScreen(image: image, title: title),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff0A203F),
            borderRadius: BorderRadius.circular(isLargeScreen ? 24 : 12), // Reduced border radius
          ),
          child: Column(
            children: [
              SizedBox(
                height: height*0.02,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: width * (isLargeScreen ? 0.3 : 0.35), // Adjusted image width
                  height: height * (isLargeScreen ? 0.12 : 0.12), // Adjusted image height
                ),
              ),
              SizedBox(
                height: height*0.01,
              ),
              Text(
                title,
                style: subTextStyle.copyWith(fontSize: isLargeScreen ? 110.sp : 12), // Adjusted text size
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

  }

