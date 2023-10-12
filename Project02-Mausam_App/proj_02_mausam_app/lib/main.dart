import 'package:flutter/material.dart';
import 'package:proj_02_mausam_app/Screens/home_screen.dart';
import 'package:proj_02_mausam_app/Screens/loading_screen.dart';
import 'package:proj_02_mausam_app/Screens/location_screen.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => MausamLoading(),
      "/home": (context) => MausamHome(),
      'select-location': (context) => MausamLocations(),
    },
  ));
}
