import 'package:flow/Components/flow_bottom_nav_bar.dart';
import 'package:flow/firebase_options.dart';
import 'package:flow/services/location_service.dart';
import 'package:flow/services/shared_prefs_methods.dart';
import 'package:flow/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'providers/flow_water_sources_data_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  flowSharedPrefs = await SharedPreferences.getInstance();
  loadSavedLocations();
  FlowLocationData().getLocation();
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.white,
  //     statusBarIconBrightness: Brightness.dark,
  //   ),
  // );

  runApp(FlowApp());
}

class FlowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FlowWaterSourcesData>(create: (BuildContext context)=> FlowWaterSourcesData()),
        ChangeNotifierProvider<FlowLocationData>(create: (BuildContext context)=> FlowLocationData())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title:  'Flow',
        theme: flowLightTheme(context),
        darkTheme: flowDarkTheme(context),
        themeMode: ThemeMode.dark,
        home: FlowBottomNavBar(),
        //  home:MyLocation(),
      ),
    );
  }
}
