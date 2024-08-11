import 'package:flutter/material.dart';
import 'package:zenfinastro/screens/screens.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.wixMadeforTextTextTheme(textTheme).copyWith(
          titleMedium: GoogleFonts.fahkwang(textStyle: textTheme.bodyMedium),
          bodyMedium:
              GoogleFonts.wixMadeforText(textStyle: textTheme.bodyMedium),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
