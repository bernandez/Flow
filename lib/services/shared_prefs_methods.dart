import 'dart:convert';

import 'package:flow/models/flow_location_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences flowSharedPrefs;
List<FlowLocation> savedLocationList = <FlowLocation>[];

///-------------Load Saved Locations -----------///
void loadSavedLocations() async {
  List<String>? locationList =
      flowSharedPrefs.getStringList("flowsavedLocationsList");
  savedLocationList = locationList!
      .map((location) => FlowLocation.fromMap(json.decode(location)))
      .toList();
}

///----------Save locations-----------///
void saveLocation() async {
  List<String> locationSPList = savedLocationList
      .map((location) => json.encode(location.toMap()))
      .toList();

  ///Saving the list
  flowSharedPrefs.setStringList("savedLocations", locationSPList);
}

///---------Add to Saved Location -----------------///
void addToSavedLocations({required FlowLocation flowLocation}){

  savedLocationList.add(flowLocation);

  saveLocation();
}

///------------Removed from Saved List ---------///
void removeLocationFromSavedList (int index){
  savedLocationList.removeAt(index);
  saveLocation();
}

