import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenfinastro/app_consts.dart';

import '../models/models.dart';

class ExServiceImage extends StatelessWidget {
  ExServiceImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _services.map((service) {
        return _ExServiceItem(service: service);
      }).toList(),
    );
  }

  final List<ExServiceModel> _services = [
    ExServiceModel(
        image: "assets/service1.png",
        title: "Astro-Guided Relocation",
        subTitle:
            "Thinking of moving? We'll help you find the best place for your success and happiness, using both star signs and real-world smarts.",
        isCyan: true),
    ExServiceModel(
        image: "assets/service2.png",
        title: "Celestial Investment Strategy",
        subTitle:
            "Make your money work for you with a mix of heavenly insight and down-to-earth financial wisdom.",
        isCyan: false),
    ExServiceModel(
        image: "assets/service3.png",
        title: "Star-Aligned Business Planning",
        subTitle:
            "Welcome to a new way of planning your business. We mix the ancient knowledge of the stars with real-world money skills to help your business shine.",
        isCyan: true),
    ExServiceModel(
        image: "assets/service4.png",
        title: "Star-Powered Debt Solutions",
        subTitle:
            "Struggling with debt? We'll help you break free using a mix of cosmic insight and proven money management techniques.",
        isCyan: false),
    ExServiceModel(
        image: "assets/service5.png",
        title: "Awakening Lord Kuber",
        subTitle:
            "Want to open the floodgates of prosperity? Let's awaken Lord Kuber, the god of wealth, in your life using ancient wisdom and modern financial strategies.",
        isCyan: true),
    ExServiceModel(
        image: "assets/service6.png",
        title: "Fortune-Attracting Logo Design",
        subTitle:
            "Need a powerful logo for your business? We'll design one that not only looks great but also aligns with cosmic energies for success.",
        isCyan: false),
    ExServiceModel(
        image: "assets/service7.png",
        title: "Cosmic Legal Guidance",
        subTitle:
            "Are legal troubles keeping you up at night? Our Cosmic Legal Guidance service combines astrology with practical legal strategy to help you face legal challenges with confidence.",
        isCyan: true),
  ];
}

class _ExServiceItem extends StatelessWidget {
  const _ExServiceItem({required this.service});

  final ExServiceModel service;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          color: service.isCyan ? AppConsts.appCyanColor : AppConsts.appBGColor,
          height: screenSize.width / 1.4,
          width: screenSize.width,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                service.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.fahkwang(
                  fontSize: 24,
                  color: !service.isCyan
                      ? AppConsts.appCyanColor
                      : AppConsts.appBGColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                service.subTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.wixMadeforText(
                  fontSize: 15,
                  color: !service.isCyan
                      ? AppConsts.appCyanColor
                      : AppConsts.appBGColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          service.image,
          width: screenSize.width,
          height: screenSize.width / 1.5,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
