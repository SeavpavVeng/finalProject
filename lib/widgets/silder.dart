import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/slider_controller.dart';

class SliderContainer extends StatefulWidget {
  const SliderContainer({Key? key}) : super(key: key);

  @override
  State<SliderContainer> createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> with SingleTickerProviderStateMixin{

   @override
  void didChangeDependencies() {
    Provider.of<SliderController>(context).getSlider();
    super.didChangeDependencies();
  }

  List imgList = [
    "asset/images/slider2.jpg",
    "asset/images/silder2.jpg",
    "asset/images/silder2.jpg",
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
     final slider = Provider.of<SliderController>(context).sliderAll;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 180,
          child: CarouselSlider(
            items: slider
                .map(
                  (item) =>  Container(
                        child: Stack(
                          children: [
                            Card(
                               shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                              child: Image.network(
                                 item.image.toString(),
                                fit: BoxFit.fill,
                                width: 1000,
                                
                              ),
                            ),
                          ],
                        ),
                      ),
                  
                  
                )
                .toList(),
            options: CarouselOptions(
               onPageChanged: (index, reason){
                setState(() {
                   activeIndex = index;
                });
               },
            height: 400,
      aspectRatio: 16/9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
   
      scrollDirection: Axis.horizontal,
            ),
            // CarouselOptions(
            //   onPageChanged: (index, reason){
            //     setState(() {
            //        activeIndex = index;
            //     });
            //   },
            //   autoPlay: true,
            //   aspectRatio: 2.0,
           
            // ),
          ),
        ),
        Container(
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: imgList.length,
          ),
        ),
        
      ],
    );
  }
}
