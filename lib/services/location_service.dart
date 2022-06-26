import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class FlowLocationData extends ChangeNotifier {
  Location location = Location();
  LatLng? currentLocation;

  late PermissionStatus _permissionStatus;
  bool _serviceEnabled = false;

  getLocation() async {
    //check permission befor getting location
    await _checkPermissions();
    /// getting current position
    await location.getLocation();

    ///listening for location changes
    location.onLocationChanged.listen(
      (LocationData currentLocationData) {
        if (currentLocationData.latitude != null ||
            currentLocationData.longitude != null) {
          currentLocation = LatLng(
              currentLocationData.latitude!, currentLocationData.longitude!);
        }
      },
    );

    notifyListeners();
  }

  Future<void> _checkPermissions() async {
    //check if phone location is on
    _serviceEnabled = await location.serviceEnabled();

    //if on, then check if the app has location permissions
    if (_serviceEnabled == true) {
      _permissionStatus = await location.hasPermission();

      if (_permissionStatus != PermissionStatus.granted) {
       //if permission status are not granted, rewuest permission
        _permissionStatus = await location.requestPermission();
      } 
    } else {
      //if phone location is not on, the ask to enable location
      _serviceEnabled = await location.requestService();
    }
  }
}