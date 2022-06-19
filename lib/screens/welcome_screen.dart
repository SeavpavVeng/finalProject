import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sports_shopping_app/screens/signup.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = const Duration(seconds: 5);
    return Timer(duration, MainRoute);
  }

  MainRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Signup()));
  }
  final controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    // final pages = List.generate(
    //   5,
    //   (index) => Container(
    //     child: CircleAvatar(
    //       backgroundImage: AssetImage("images/nike_ball_4.png"),
    //     ),
    //     // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(16),
    //   color: Colors.grey.shade300,
    // ),
    // ),
    //);
    return Scaffold(
      backgroundColor: const Color(0xffe0e0e0),
      body: Stack(
        children: <Widget>[
          Positioned(
            child: ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Color(0xff03a9f4), Color(0xff004ba0)],
                  begin: Alignment.centerRight,
                  end: Alignment(-1.0, -1.0),
                )),
              ),
            ),
          ),
         Center(
            heightFactor: 4,
            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
              //shape: BoxShape.circle,
              // color: Colors.white,
                image: DecorationImage(
                image: AssetImage("asset/images/logo.png"),
                fit: BoxFit.cover,
              )),
            ),
            //child: Text("Phteas Keila", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
          
          ),
          Positioned(
              left: 100,
              top: 250,
              child: Center(
                child: Container(
                  width: 300,
                  height: 350,
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                      //shape: BoxShape.circle,
                      // color: Colors.white,
                      image: DecorationImage(
                    image: AssetImage("asset/images/pic_02.png"),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              
              // child: PageView.builder(
              //   controller: controller,
              //   // itemCount: pages.length,
              //   itemBuilder: (_, index) {
              //     return pages[index % pages.length];
              //   },
              // ),
              ),
            Positioned(
              bottom: 80,
              left: 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Welcome", style: TextStyle(fontSize: 40, color: Color(0xff03a9f4)),),      
                  Text("Good Quality Good Service Best Price ", style: TextStyle(fontSize: 18, color:Color(0xff004ba0)),),
            
                ],
              ),
            ),
           
          // Positioned(
          //   left: 120,
          //   top: 500,
          //   child: SmoothPageIndicator(
          //       controller: controller,
          //     //  count: pages.length,
          //       effect: ScrollingDotsEffect(
          //         activeStrokeWidth: 3,
          //         activeDotScale: 1.3,
          //         maxVisibleDots: 5,
          //         radius: 8,
          //         spacing: 10,
          //         dotHeight: 12,
          //         dotWidth: 12,
          //       )),
          //),
        ],
      ),
      // child: CircleAvatar(
      //   backgroundImage: AssetImage("images/nike_ball_4.png"),
      // ),

      // body: Stack(
      //   overflow: Overflow.visible,
      //   children: [
      //   ClipPath(
      //      child:Stack(
      //       children: [
      //         Container(

      //           decoration: const BoxDecoration(
      //               color: Colors.red,
      //               gradient: LinearGradient(
      //                 colors: [Color(0xff2159db), Color(0xff753fe4)],
      //                 begin: Alignment.centerRight,
      //                 end: Alignment(-1.0, -1.0),
      //               )),
      //         ),
      //         Center(
      //           child: Column(
      //             children: [
      //               Padding(
      //                 padding: EdgeInsets.only(top: 282),
      //                 child: CircleAvatar(
      //                   backgroundColor: Colors.black,
      //                   radius: 90.0,
      //                   child: Image.asset("images/nike_ball_4.png", fit: BoxFit.fill,),

      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         // Container(
      //         //   width: 100 ,
      //         //   height: 300,
      //         //   padding: const EdgeInsets.all(10.0),
      //         //   decoration: const BoxDecoration(
      //         //     shape: BoxShape.circle,
      //         //     color: Colors.white,
      //         //     image: DecorationImage(
      //         //       image: AssetImage("images/nike_ball_4.png"),
      //         //       fit: BoxFit.cover,
      //         //     )
      //         //  ),
      //         // ),
      //       ],
      //     ),

      //     clipper: HeaderClipper(),
      //   ),
      //   ],
      // ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // var path = Path();
    // path.lineTo(0.0, size.height - 200);
    // path.lineTo(size.width, size.height - 390);
    // path.lineTo(size.width, 0.0);
    // path.close();
    // return path;
    Path path = Path();
    path.lineTo(0, size.height - 220);
    path.cubicTo(size.width / 4, 5 * size.height / 6, 5 * size.width / 6,
        size.height / 4, size.width, size.height - 410);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
