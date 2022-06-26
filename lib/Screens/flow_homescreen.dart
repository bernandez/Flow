import 'package:flutter/material.dart';
import 'package:flow/Components/flow_app_bar.dart';
import 'package:flow/Components/flow_maps.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../Components/search_closest_source_button.dart';

class FlowHomeScreen extends StatefulWidget {
  const FlowHomeScreen({Key? key}) : super(key: key);

  @override
  _FlowHomeScreenState createState() => _FlowHomeScreenState();
}

class _FlowHomeScreenState extends State<FlowHomeScreen> {
  // double shortestDistance;
  // String closestSourceDistance;
  // String closestSourceID;
  // String closestSourceDescription;
  // List<double> sourceDistancesList;
  // LatLng currentLocation;
  // LatLng markerLocation;
  // GeoPoint firebaseLocation;

  


  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      appBar: FlowAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            FlowMaps(),
            Padding(
          padding: EdgeInsets.fromLTRB(16, 80, 16, 16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                IconButton(
                 onPressed:(){
                  HapticFeedback.lightImpact();
                  Feedback.forTap(context);
                   ///TODO: add method to swtich map type
                 },
              
                icon: SvgPicture.asset('Assets/icons/svgs/fi-rr-map-change.svg', color: Theme.of(context).primaryColor,)  ,
                ), // toggle map type button
                SizedBox(height: 10.0),
                SearchClosestSourceButton(),

           
              ],
            ),
          ),
        ),
    
          ],
        ),
      ),
      //  bottomNavigationBar: FlowBottomNavBar(),
    );
  }

}
