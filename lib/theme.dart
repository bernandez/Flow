
import 'package:flow/constants.dart';
import 'package:flutter/material.dart';

ThemeData flowLightTheme(BuildContext context){



  return ThemeData(
      //appBarTheme: appBarTheme,
      primaryColor: kBlue,
      primaryColorLight: kBlue80,
     // primaryColorDark: kPurple,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: kDark),
      primaryIconTheme: const IconThemeData(color: kDark),
      fontFamily: 'Product Sans',
      textTheme: TextTheme(
        bodyText1: kBodyBold.copyWith(color: kDark),
        bodyText2: kBody.copyWith(color: kDark),
        headline1: kHeading.copyWith(color: kDark),
        headline2: kHeadingLight.copyWith(color: kDark),
      ),
      colorScheme: const ColorScheme.light().copyWith(secondary: kFuchsia),
      cardColor: kDark20,
      canvasColor: Colors.transparent);

}

ThemeData flowDarkTheme(BuildContext context){

  return ThemeData(
      //appBarTheme: appBarTheme,
      primaryColor: kBlueDark,
      primaryColorLight: kBlueDark80,
     // primaryColorDark: kPurple,
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
      primaryIconTheme: const IconThemeData(color: Colors.white),
      fontFamily: 'Product Sans',
      
      textTheme: TextTheme(
        bodyText1: kBodyBold.copyWith(color: Colors.white),
        bodyText2: kBody.copyWith(color: Colors.white),
        headline1: kHeading.copyWith(color: Colors.white),
        headline2: kHeadingLight.copyWith(color: Colors.white),
      ),
      colorScheme: const ColorScheme.dark().copyWith(secondary: kFuchsia),
      cardColor: kDark40,
      canvasColor: Colors.transparent);

}


