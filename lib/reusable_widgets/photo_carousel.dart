import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PhotoCarousel extends StatefulWidget {
  const PhotoCarousel({required this.urls, super.key});
  final List<String> urls;

  @override
  State<PhotoCarousel> createState() => _PhotoCarouselState();
}

class _PhotoCarouselState extends State<PhotoCarousel> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 257,
      child: Stack(
        children: [
          CarouselSlider.builder(
              itemCount: widget.urls.length,
              options: CarouselOptions(
                height: 257,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                final urlImage = widget.urls[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      urlImage,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white,),
                
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5.0, vertical: 3),
                  child: AnimatedSmoothIndicator(
                    effect: ColorTransitionEffect(dotHeight: 7, dotWidth: 7, activeDotColor: Colors.black, dotColor: Colors.black.withOpacity(0.22)),
                    activeIndex: activeIndex,
                    count: widget.urls.length,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
