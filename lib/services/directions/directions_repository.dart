import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '.env.dart';
import 'directions_model.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;
  Directions? directionData;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();
  Future<Directions> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': googleAPIKey,
      },
    );
    //  check if response is successful
    if (response.statusCode == 200) {
      debugPrint('response is successful');
      // print('response data from model is ${response.data}');
      return Directions.fromMap(response.data);
    }
    debugPrint('an error has occured:');
    return response.data;

   
  }
}
