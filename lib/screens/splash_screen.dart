import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zenfinastro/app_consts.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:zenfinastro/screens/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  DateTime selectedDate = DateTime.now();
  String countryCode = "+91";
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 18))
        ..repeat();

  late TextEditingController dateController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    checkFirstRun();

    dateController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
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

  @override
  void dispose() {
    dateController.dispose();
    emailController.dispose();
    phoneController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void showForm() {
    showDialog(
      context: context,
      barrierColor: Colors.black12,
      barrierDismissible: false,
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
              _FormField(
                label: "Email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              _FormField(
                label: "Date of Birth",
                isDOB: true,
                keyboardType: TextInputType.datetime,
                controller: dateController,
                onTapCalendar: () => _selectDate(context),
              ),
              _FormField(
                label: "Phone Number",
                controller: phoneController,
                keyboardType: TextInputType.phone,
                countryCode: CountryCodePicker(
                  onChanged: (value) => setState(() {
                    countryCode = value.dialCode ?? "+91";
                  }),
                  showFlag: false,
                  showFlagDialog: true,
                  initialSelection: countryCode,
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                  barrierColor: Colors.black12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  height: 60,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: onTapSubmit,
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

  Future<void> _selectDate(BuildContext context) async {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950, 8),
      lastDate: DateTime(2101),
      barrierColor: Colors.black12,
      barrierDismissible: false,
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme:
                  const ColorScheme.light(primary: AppConsts.appCyanColor),
            ),
            child: child!);
      },
    );
    if (picked != null && picked != DateTime.now()) {
      final String formatted = formatter.format(picked);
      dateController.text = formatted;
    }
  }

  Future<void> onTapSubmit() async {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter a valid email id."),
        backgroundColor: Colors.red,
      ));
    } else if (dateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter a DOB."),
        backgroundColor: Colors.red,
      ));
    } else if (phoneController.text.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter a valid Phone Number."),
        backgroundColor: Colors.red,
      ));
    } else {
      DateFormat dateFormat = DateFormat("dd/MM/yyyy");
      final dateTime = dateFormat.tryParse(dateController.text);
      if (dateTime != null) {
        Duration difference = DateTime.now().difference(dateTime);
        if (difference.inDays < 6575) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //TODO: Check this error logic
            content: Text("Please enter a valid DOB."),
            backgroundColor: Colors.red,
          ));
        } else {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool("is_not_first_run", true);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter a valid DOB."),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  void checkFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool("is_not_first_run") ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      if (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      } else {
        showForm();
      }
    });
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.label,
    this.controller,
    this.keyboardType,
    this.isDOB = false,
    this.countryCode,
    this.onTapCalendar,
  });

  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isDOB;
  final Widget? countryCode;
  final Function()? onTapCalendar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
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
            ),
            prefixIcon: countryCode,
            suffixIcon: isDOB
                ? IconButton(
                    onPressed: onTapCalendar,
                    icon: const Icon(
                      Icons.calendar_today,
                      color: AppConsts.appCyanColor,
                    ),
                  )
                : null),
        keyboardType: keyboardType,
      ),
    );
  }
}
