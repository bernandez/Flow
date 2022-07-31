import 'package:flow/Components/bottom_sheet_info.dart';
import 'package:flow/models/flow_location_model.dart';
import 'package:flow/providers/flow_water_sources_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class FlowMaps extends StatefulWidget {
  FlowMaps({Key? key, this.toggleMapType}) : super();

  final VoidCallback? toggleMapType;

  @override
  _FlowMapsState createState() => _FlowMapsState();
}

class _FlowMapsState extends State<FlowMaps> {
  // Completer<GoogleMapController> _controller = Completer();
  static final LatLng _center = const LatLng(6.012484, 10.259225);
  final Set<Marker> flowMarkers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.hybrid;
//  GoogleMapController mapController = GoogleMapController();
  late BitmapDescriptor mapMarkerRed;
  late BitmapDescriptor mapMarkerGreen;
  late BitmapDescriptor mapMarker;

  @override
  initState() {
    super.initState();
    setCustomMarker();
  }

  ///Setting custom marker icons
  void setCustomMarker() async {
    mapMarkerGreen = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/marker-icon-green.png');
    mapMarkerRed = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/marker-icon-red.png');
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  /// function to toggle between normal view and satellite view when the button is pressed
  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType =
          _currentMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlowWaterSourcesData>(builder: (context, flowData, child) {
      for (int i = 0; i < flowData.flowLocationList.length; i++) {
        flowMarkers.add(
          new Marker(
            flat: false,
            draggable: false,
            zIndex: 5,
            icon: mapMarker,
            markerId: MarkerId(flowData.flowLocationList[i].id),
            position: LatLng(flowData.flowLocationList[i].lat,
                flowData.flowLocationList[i].long),
            infoWindow: InfoWindow(title: flowData.flowLocationList[i].name),

            onTap: () async {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return BottomSheetInfo(
                      waterSource: flowData.flowLocationList[i]);
                },
              );
            }, //load bottom sheet
          ),
        );
      }
      return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
          mapType: _currentMapType,
          markers: flowData.flowMarkers,
          onCameraMove: _onCameraMove,
          myLocationEnabled: true,
          polylines: {
            if (flowData.directions != null)
              Polyline(
                geodesic: true,
                polylineId: const PolylineId('overview_polyline'),
                width: 6,
                zIndex: 1,
                endCap: Cap.roundCap,
                startCap: Cap.roundCap,
                jointType: JointType.bevel,
                points: flowData.directions!.polylinePoints
                    .map((e) => LatLng(e.latitude, e.longitude))
                    .toList(),
              ),
          }
          //   onMapCreated: (GoogleMapController controller) {
          //      mapController = controller;
          //    },
          );
    });
  }
}
