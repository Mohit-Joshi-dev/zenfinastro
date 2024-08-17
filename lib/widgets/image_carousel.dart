import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenfinastro/models/models.dart';

class ImageCarousel extends StatelessWidget {
  ImageCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: _images.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  _images[itemIndex].image,
                ),
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.25),
                  BlendMode.colorDodge,
                ))),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 6),
        child: Text(
          _images[itemIndex].text,
          textAlign: TextAlign.center,
          style: GoogleFonts.fahkwang(),
        ),
      ),
      options: CarouselOptions(
        aspectRatio: 1,
        disableCenter: false,
        enableInfiniteScroll: true,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1200),
      ),
    );
  }

  final List<ImageCarouselModel> _images = [
    ImageCarouselModel(
        image: "assets/cousol1.webp",
        text:
            "Optimize your career moves with precision timing based on celestial events"),
    ImageCarouselModel(
        image: "assets/cousol2.webp",
        text:
            "Design prosperity-attracting logos using sacred geometry and Vastu principles"),
    ImageCarouselModel(
        image: "assets/cousol3.webp",
        text:
            "Identify your most suitable investment avenues, from stocks to startups"),
    ImageCarouselModel(
        image: "assets/cousol4.webp",
        text:
            "Overcome financial challenges with practical, star-guided solutions"),
    ImageCarouselModel(
        image: "assets/cousol5.webp",
        text:
            "Discover your ideal business path aligned with your cosmic destiny"),
    ImageCarouselModel(
        image: "assets/cousol6.webp",
        text:
            "Navigate global opportunities with our specialized relocation astrology"),
  ];
}
