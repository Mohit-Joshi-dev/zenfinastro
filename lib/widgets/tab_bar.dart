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
                    print("navigate to home");
                    if (!isHome) {
                      print("navigate to home");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }
                  },
                ),
                Tabs(
                  text: "Services",
                  isActive: isHome,
                  onTap: () {
                    print("navigate to services");
                    if (isHome) {
                      print("navigate to services");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ServicesScreen()));
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
