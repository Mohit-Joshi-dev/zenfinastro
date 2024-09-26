// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: PhysicalModel(
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
      ),
    );
  }

  String getUrl(String message, String phone) {
    if (Platform.isAndroid) {
      return "https://wa.me/$phone/?text=${Uri.parse(message)}";
    } else {
      return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}";
    }
  }
}
