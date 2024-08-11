import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key, required this.text, required this.isActive});

  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 90,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: GoogleFonts.wixMadeforText(
                      color: isActive ? Colors.blue : null, fontSize: 15),
                ),
              ),
            ),
          ),
          Container(
            height: 1.5,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
