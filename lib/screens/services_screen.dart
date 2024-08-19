import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenfinastro/app_consts.dart';
import 'package:zenfinastro/data/data.dart';
import 'package:zenfinastro/widgets/service_item.dart';
import 'package:zenfinastro/widgets/tab_bar.dart' as tb;

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConsts.appBGColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const tb.TabBar(
                isHome: false,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Services List",
                    style: GoogleFonts.fahkwang(fontSize: 26),
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: serviceList.length,
                itemBuilder: (context, index) {
                  final service = serviceList[index];
                  return ServiceItem(
                    image: service["image"] ?? "",
                    text: service["title"] ?? "",
                  );
                },
              ),
              const SizedBox(height: 200)
            ],
          ),
        ),
      ),
    );
  }
}
