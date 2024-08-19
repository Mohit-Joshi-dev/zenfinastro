import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key, required this.text, required this.image});

  final String text, image;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset(
            image,
            width: screenSize.width - 40,
            height: screenSize.width - 40,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            style: GoogleFonts.fahkwang(fontSize: 18),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStateColor.resolveWith((states) => Colors.black),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)))),
              onPressed: () {},
              child: Text(
                "Start Now",
                style: GoogleFonts.wixMadeforDisplay(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
