import 'package:flutter/material.dart';
import 'package:proj_02_mausam_app/Screens/home_screen.dart';
import 'package:proj_02_mausam_app/Screens/loading_screen.dart';
import 'package:proj_02_mausam_app/Screens/location_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => MausamLoading(),
      // "/": (context) => MausamLocations(),
      "/home": (context) => MausamHome(),
      '/select-location': (context) => MausamLocations(),
      '/loading-location-data': (context) => MausamLoading(),
    },
  ));
}


// neukunoillani-3403@yopmail.com
// RRZ.*?aN9b)!Byd
// https://home.openweathermap.org/users/sign_up