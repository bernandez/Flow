import 'package:flow/Components/flow_bottom_nav_bar.dart';
import 'package:flow/services/shared_prefs_methods.dart';
import 'package:flow/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  flowSharedPrefs = await SharedPreferences.getInstance();
  loadSavedLocations();

  
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flow',
      theme: flowLightTheme(context),
      darkTheme: flowDarkTheme(context),
      themeMode: ThemeMode.system,
      home: FlowBottomNavBar(),
      //  home:MyLocation(),
    );
  }
}
