import 'package:flutter/material.dart';
import 'package:zenfinastro/screens/screens.dart';
import 'package:zenfinastro/widgets/widgets.dart';

class TabBar extends StatelessWidget {
  const TabBar({
    super.key,
    this.isHome = true,
  });

  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Tabs(
                  text: "Home",
                  isActive: !isHome,
                  onTap: () {
                    if (!isHome) {
                      Navigator.pop(context);
                    }
                  },
                ),
                Tabs(
                  text: "Services",
                  isActive: isHome,
                  onTap: () {
                    if (isHome) {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const ServicesScreen(),
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ));
                    }
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                debugPrint("logo");
              },
              child: Image.asset(
                "assets/appBarLogo.png",
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum TabBarIndex { home, services }
