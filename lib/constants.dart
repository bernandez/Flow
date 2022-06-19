import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color kBlue = Color(0xFF12A4EF);
Color kBlue80 = Color(0xFF12A4EF).withOpacity(.8);
Color kBlue60 = Color(0xFF12A4EF).withOpacity(.6);
Color kBlue40 = Color(0xFF12A4EF).withOpacity(.4);
Color kBlue20 = Color(0xFF12A4EF).withOpacity(.2);

Color kBlueDark = Color(0xFF3EBFFF);
Color kBlueDark80 = Color(0xFF3EBFFF).withOpacity(.8);
Color kBlueDark60 = Color(0xFF3EBFFF).withOpacity(.6);
Color kBlueDark40 = Color(0xFF3EBFFF).withOpacity(.4);
Color kBlueDark20 = Color(0xFF3EBFFF).withOpacity(.2);

//const secondarycolor = Color(0xFF40EFB8);
//const textcolor = Color(0xFF444444);
const orangecolor = Color(0xFFFFA070);
//const darkbluecolor = Color(0xFF694DE8);
const purplecolor = Color(0xFF7960E2);
const kFuchsia = Color(0xFFF86272);

const Color kDark = Color(0xFF353535);
const Color kDark80 = Color(0xB3353535);
const Color kDark60 = Color(0x80353535);
const Color kDark40 = Color(0x4D353535);
const Color kDark20 = Color(0x1A353535);

double screenHeight = MediaQueryData().size.height;
double screenWidth = MediaQueryData().size.width;

const double kDefaultPadding = 16;
const double kDefaultPadding2x = 32;


///----TextStyles----///
const TextStyle kHeading = TextStyle(fontWeight: FontWeight.bold, fontSize: 28);
const TextStyle kHeadingLight =
    TextStyle(fontWeight: FontWeight.normal, fontSize: 28);
const TextStyle kBody = TextStyle(fontWeight: FontWeight.normal, fontSize: 14);
const TextStyle kBodyBold =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
const TextStyle kButtonText =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const TextStyle kFootNote =
    TextStyle(fontWeight: FontWeight.normal, fontSize: 11);
