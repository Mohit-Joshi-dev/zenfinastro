// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overflow_text_animated/overflow_text_animated.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zenfinastro/app_consts.dart';
import 'package:zenfinastro/screens/screens.dart';

import '../widgets/widgets.dart';
import 'package:zenfinastro/widgets/tab_bar.dart' as tb;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _topScrollController;
  late ScrollController _bottomScrollController;

  @override
  void initState() {
    super.initState();
    _topScrollController = ScrollController();
    _bottomScrollController = ScrollController(keepScrollOffset: true);

    _topScrollController.addListener(
      () {
        final val = _topScrollController.position.pixels;
        if (val <= 120) {
          _bottomScrollController.jumpTo(val);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConsts.appBGColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _bottomScrollController,
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  const _MiddleWidget(),
                  SizedBox(
                    height: screenSize.height,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
                controller: _topScrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    const tb.TabBar(
                      isHome: true,
                    ),
                    SizedBox(height: screenSize.width),
                    ColoredBox(
                      color: AppConsts.appBGColor,
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          const GoldStrip(text: "How we work"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 30,
                            ),
                            child: Text(
                              """With over three decades of entrepreneurial experience, we provide down-to-earth advice empowered by cosmic intelligence. Whether you're launching a venture, facing legal uncertainties, or seeking to amplify your wealth, our celestial strategies illuminate your path to success.\nReady to align your financial decisions with the wisdom of the stars? Book your transformative consultation today and step into a future where your potential is as limitless as the universe itself.""",
                              style: GoogleFonts.wixMadeforText(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ColoredBox(
                              color: AppConsts.appCyanColor,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 30),
                                child: Text(
                                  "Unlock the power of the cosmos combined with proven financial expertise to navigate your business and personal wealth decisions. At Zen Financial Astrology, we offer a unique blend of celestial wisdom and over three decades of corporate finance experience to guide your path to success.",
                                  style: GoogleFonts.fahkwang(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ImageCarousel(),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: GoldStrip(text: "Services"),
                          ),
                          ExServiceImage(),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: GoldStrip(text: "Sunil Shah"),
                          ),
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                color: AppConsts.appCyanColor,
                                width: screenSize.width,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      "As your Astral Financial Advisor, Sunil Shah, CA, brings together a unique blend of expertise:",
                                      style: GoogleFonts.wixMadeforText(
                                        fontSize: 15,
                                        color: AppConsts.appBGColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const UnorderedListWidget([
                                      "3 decades of deep immersion in Astrology, Vastu, and Cosmic Sciences, guided by learned gurus",
                                      "30+ years of hands-on experience in corporate finance and strategic leadership",
                                      "Mastery in applying celestial wisdom to real-world financial decisions",
                                      "Expertise in fund management, business modeling, and financial restructuring",
                                      "Certified financial consultant with a strong background in modern business systems.",
                                    ]),
                                    Text(
                                      "\nMy journey has been shaped by the teachings of esteemed gurus, whose profound knowledge in Astrology, Vastu, and Cosmic Sciences I've had the privilege to learn and apply. This spiritual wisdom, combined with my extensive corporate experience, allows me to offer guidance that bridges the ancient and the modern, the cosmic and the practical.\nWhether you're leading a large corporation or taking your first steps as an entrepreneur, our approach combines time-tested celestial strategies with solid financial principles. We don't just plan for success – we align your path with the cosmic forces that shape our world.\nReady to unlock your true potential and navigate your financial journey with cosmic insight? Book your transformative consultation today. Together, we'll chart a course for your prosperity that's as expansive as the universe itself.",
                                      style: GoogleFonts.wixMadeforText(
                                        fontSize: 15,
                                        color: AppConsts.appBGColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //TODO: Client Photo
                              Image.asset(
                                "assets/service4.png",
                                width: screenSize.width,
                                height: screenSize.width * 1.5,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: GoldStrip(text: "Why Choose Us"),
                          ),
                          const _BottomView(
                            title: "Star-Aligned Timing",
                            subtitle:
                                "Know when to make your move. We'll show you the best times to launch projects, sign deals, or make big changes. It's like having a cosmic calendar for your success.",
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const _BottomView(
                            title: "Money Sense Meets",
                            subtitle:
                                "Get advice that's both practical and cosmic. We blend real-world money smarts with star wisdom. It's not just about what to do, but when and how to do it for the best results.",
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const _BottomView(
                            title: "Your Complete Success Blueprint",
                            subtitle:
                                "We consider all aspects of your life to create a personalized prosperity plan. From career goals to personal aspirations, we help you design a well-rounded path to success and fulfillment.",
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
        bottomNavigationBar: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const ServicesScreen(),
                    transitionDuration: const Duration(milliseconds: 500),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ));
            },
            child: const GoldStrip(text: "Our Exclusive Services")),
        floatingActionButton: PhysicalModel(
          color: Colors.black,
          elevation: 10.0,
          shape: BoxShape.circle,
          child: CircleAvatar(
            radius: 33,
            backgroundColor: AppConsts.appBGColor,
            child: IconButton(
                highlightColor: AppConsts.appBGColor,
                onPressed: () async {
                  debugPrint("Navigate to whatsapp");
                  final url = getUrl("This is a test message.", "8850011635");
                  if (await canLaunchUrl(Uri.parse(url))) {
                    launchUrl(Uri.parse(url));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Unable to connect to WhatsApp"),
                    ));
                  }
                },
                icon: const Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green,
                  size: 45,
                )),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _topScrollController.dispose();
    _bottomScrollController.dispose();
    super.dispose();
  }

  String getUrl(String message, String phone) {
    if (Platform.isAndroid) {
      return "https://wa.me/$phone/?text=${Uri.parse(message)}";
    } else {
      return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}";
    }
  }
}

class _BottomView extends StatelessWidget {
  const _BottomView({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      color: AppConsts.appCyanColor,
      width: screenSize.width,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
      child: Column(children: [
        ColoredBox(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.fahkwang(fontSize: 24),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Text(
              subtitle,
              style:
                  GoogleFonts.wixMadeforText(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            "assets/downArrow.png",
            height: 100,
            width: 100,
          ),
        )
      ]),
    );
  }
}

class _MiddleWidget extends StatelessWidget {
  const _MiddleWidget();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          "assets/appMiddleImage.webp",
          height: screenSize.width,
          width: screenSize.width,
          fit: BoxFit.cover,
          color: Colors.white.withOpacity(0.35),
          colorBlendMode: BlendMode.colorDodge,
        ),
        SizedBox(
          height: screenSize.width,
          width: screenSize.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome to Zen Financial Astrology",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.fahkwang(fontSize: 24),
                ),
                Text(
                  "Your Astral Business Advisor",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.fahkwang(fontSize: 18),
                ),
                const SizedBox(height: 20),
                OverflowTextAnimated(
                  text:
                      "As your Astral Business Advisor, we offer unique insights that go beyond traditional financial planning.",
                  style: GoogleFonts.fahkwang(),
                  curve: Curves.linear,
                  animation: OverFlowTextAnimations.infiniteLoop,
                  animateDuration: const Duration(milliseconds: 80),
                  loopSpace: 100,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
