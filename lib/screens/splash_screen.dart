import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenfinastro/app_consts.dart';
import 'dart:math' as math;

import 'package:zenfinastro/screens/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 18))
        ..repeat();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () => showForm());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConsts.appCyanColor,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: child,
            );
          },
          child: Image.asset(
            "assets/loading1.png",
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.width - 40,
          ),
        ),
      ),
    );
  }

  void showForm() {
    showDialog(
      context: context,
      barrierColor: Colors.black12,
      builder: (context) => Dialog(
        backgroundColor: AppConsts.appBGColor.withOpacity(0.8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)), //this right here
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const _FormField(
                label: "Please Enter Email id",
              ),
              const _FormField(
                label: "Please Enter Phone Number",
              ),
              const _FormField(
                label: "Please Enter DOB",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  height: 60,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: WidgetStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        backgroundColor: const WidgetStatePropertyAll(
                            AppConsts.appCyanColor)),
                    child: Text(
                      "Submit",
                      style: GoogleFonts.wixMadeforDisplay(
                        color: AppConsts.appGoldColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({required this.label, this.controller});

  final String label;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
            label: Text(
              label,
              style: GoogleFonts.wixMadeforDisplay(color: Colors.black),
            ),
            floatingLabelStyle:
                GoogleFonts.wixMadeforDisplay(color: Colors.black),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            )),
      ),
    );
  }
}
