import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow/models/flow_location_model.dart';
import 'package:flow/services/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FlowWaterSourcesData extends ChangeNotifier{

  List<FlowLocation> flowLocationList = [];


  void getFlowWaterSources(){

  Stream<QuerySnapshot> firebaseData = FirestoreService().getFlowData("bambili");

  ///Add to the list of locations
  
StreamBuilder(stream: firebaseData,
builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot,);
  }



}