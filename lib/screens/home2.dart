import 'package:apple_diseases_detector/customeAnimations/fade_in_slide.dart';
import 'package:apple_diseases_detector/screens/fruitDetection/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../utils/asset_utils/assets_util.dart';
import 'leafDetection/homeLeafDetection.dart';
import 'results/results.dart';

class TenHome extends StatefulWidget {
  const TenHome({super.key});

  @override
  _TenHomeState createState() => _TenHomeState();
}

class _TenHomeState extends State<TenHome> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  bool isTileTappedMap = false;
  Color greenShade50 = Colors.green.withOpacity(0.5);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.onePrimaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [



          ],
        ),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Welcome to Apple Disease Detection\nwhere you can detect a disease with a single click',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Pallete.light,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      )
                  ).animate().slideX(begin: 1, duration: const Duration(seconds: 1)),
                ),
                const SizedBox(
                  height: 4,
                ),



                const SizedBox(
                  height: 20,
                ),


              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,

      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
          ),
          Container(

            height: 100,
            decoration:  BoxDecoration(
              color: Pallete.onePrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(300),
                  bottomLeft:  Radius.circular(80)
              ),
            ),
          ),

          Positioned(
            top: 40,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),



                    ),
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.92,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              alignment: Alignment.topCenter,
                              image: AssetImage(
                                Assets.eezimedzLogo,

                              )
                          )
                      ),

                    ),
                  ),

                  const SizedBox(
                    height: 100,
                  ),

                  FadeInSlide(
                    duration: 1,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-1, -1),
                            blurRadius: 5,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(1, 1),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.82,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "What do you wanna do ?",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: Pallete.onePrimaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                )
                            ).animate().slideX(begin: -2, duration: const Duration(seconds: 2)),

                            Text(
                                "Please choose how you'd like to use our app",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Pallete.onePrimaryColor,
                                  fontSize: 12,
                                )
                            ).animate().slideY(begin: 1, duration: const Duration(seconds: 2)),
                            SizedBox(
                              height: 12,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: roleWidget(
                                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomePageLeaf())),
                                          color:   Pallete.onePrimaryColor,
                                          textIconColour:  Colors.white ,
                                          center: "Detect",
                                          bottom: "Leaf",
                                          icon: Icons.library_books
                                      ),
                                    ),

                                    SizedBox(
                                      width: 8,
                                    ),
                                    // HomePage
                                    Expanded(
                                      child: roleWidget(
                                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>HomePage())),
                                          color:   Pallete.onePrimaryColor,
                                          textIconColour:  Colors.white ,
                                          center: "Detect",
                                          bottom: "Fruit",
                                          icon: Icons.library_books
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 8,
                                ),

                                Row(
                                  children: [
                                    Expanded(
                                      child: roleWidget(
                                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Results())),
                                          color:   Pallete.onePrimaryColor,
                                          textIconColour:  Colors.white ,
                                          center: "View",
                                          bottom: "Results",
                                          icon: Icons.library_books
                                      ),
                                    ),

                                    SizedBox(
                                      width: 8,
                                    ),
                                    // HomePage
                                    Expanded(
                                      child: SizedBox()
                                    ),
                                  ],
                                ),
                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }



Widget roleWidget({required Color color, required Color textIconColour, required void Function() onTap, required String center, required IconData icon, required String bottom}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Pallete.onePrimaryColor
          )
      ),

      child: Row(
        children: [

          Icon(
            icon,
            color: textIconColour,
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            "$center\n$bottom",
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: textIconColour,
              fontWeight: FontWeight.bold,

            ),
          )
        ],
      ),
    ),
  );
}
}



