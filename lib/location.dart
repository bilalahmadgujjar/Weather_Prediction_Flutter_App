import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
    } catch(e) {
      print(e);
    }
  }
}
