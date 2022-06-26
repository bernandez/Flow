import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow/models/flow_location_model.dart';
import 'package:flow/services/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../services/directions/directions_model.dart';

class FlowWaterSourcesData extends ChangeNotifier{

  List<FlowLocation> flowLocationList = [];
  List<FlowLocation> savedLocationsList = [];
  FlowLocation? closestLocation;
  double? shortestDistance;
  Directions? directions;
  Set<Marker> flowMarkers ={};

 // Stream<QuerySnapshot> firebaseData = FirestoreService().getFlowData("bambili");


void getFlowData(){

}

void calculateClosestLocation(){
 // TODO: Implement calculate closest distance
}




}