import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenfinastro/app_consts.dart';

import '../widgets/widgets.dart';

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
                  const _TopBar(),
                  const _MiddleWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
                controller: _topScrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width + 120),
                    ColoredBox(
                      color: AppConsts.appBGColor,
                      child: Column(
                        children: [
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
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ],
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
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                Tabs(text: "Home", isActive: true),
                Tabs(text: "Services", isActive: false),
              ],
            ),
            Image.asset(
              "assets/appBarLogo.png",
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}

class _MiddleWidget extends StatelessWidget {
  const _MiddleWidget();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/appMiddleImage.webp",
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
      color: Colors.white.withOpacity(0.35),
      colorBlendMode: BlendMode.colorDodge,
    );
  }
}
