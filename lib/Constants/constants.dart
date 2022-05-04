import 'package:flutter/material.dart';

const String coopLogo = "asset/images/coop.png";
const String coopWhiteLogo = "asset/images/coop white.png";
const String coopOnboarding = "asset/images/coopOnboarding.gif";
const String coopFeedback = "asset/images/coopFeedback.gif";

const Color coopPrimaryColor = Color(0xff00A5E3);
const int coopPrimaryColorInt = 0xFF00A5E3;
const MaterialColor coopMaterialColor = MaterialColor(
  coopPrimaryColorInt,
  const <int, Color>{
    50: const Color(0xFFDFF4FD),
    100: const Color(0xFFBFEAFB),
    200: const Color(0xFF7FD6F7),
    300: const Color(0xFF5FCCF5),
    400: const Color(0xFF3FC2F3),
    500: const Color(coopPrimaryColorInt),
    600: const Color(0xFF0082B3),
    700: const Color(0xFF005777),
    800: const Color(0xFF002B3B),
    900: const Color(0xFF011922),
  },
);

TextStyle titleLeading = TextStyle(
    fontWeight: FontWeight.w500, fontSize: 20, color: Colors.grey.shade400);
TextStyle labelhint = TextStyle(color: Colors.grey.shade300);
