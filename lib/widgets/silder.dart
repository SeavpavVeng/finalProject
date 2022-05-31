import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderContainer extends StatefulWidget {
  const SliderContainer({Key? key}) : super(key: key);

  @override
  State<SliderContainer> createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  List imgList = [
    "asset/images/pic_02.png",
    "asset/images/pic_02.png",
    "asset/images/pic_02.png",
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 180,
          child: CarouselSlider(
            items: imgList
                .map(
                  (item) => Container(
                    child: Card(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: 1000,
                          ),
                        ],
                      ),
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
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
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
