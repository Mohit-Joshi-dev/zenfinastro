import 'package:flutter/material.dart';
import 'package:zenfinastro/app_consts.dart';
import 'package:zenfinastro/widgets/tab_bar.dart' as tb;

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConsts.appBGColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            tb.TabBar(
              isHome: false,
            ),
          ],
        ),
      ),
    );
  }
}
