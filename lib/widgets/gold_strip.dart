import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class GoldStrip extends StatelessWidget {
  const GoldStrip({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/goldStrip.png"),
        fit: BoxFit.cover,
      )),
      alignment: Alignment.center,
      child: Text(text,
          style: GoogleFonts.fahkwang(
            fontSize: 22,
          )),
    );
  }
}
