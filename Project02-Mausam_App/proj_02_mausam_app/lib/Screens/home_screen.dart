import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MausamHome extends StatefulWidget {
  const MausamHome({super.key});

  @override
  State<MausamHome> createState() => _MausamHomeState();
}

class _MausamHomeState extends State<MausamHome> {
  int counter = 1;
  String username = '';
  String extraURLaddiotions = '';
  String URLadditions = '';
  String weatherAPIurl = 'https://api.openweathermap.org/data/2.5/';
  Map apikeys = {
    'default': "a4e2837340e48848376046081baa0193",
    'current': 'f41876d95649c742f2d05ec20a48264f',
    'forecast5': 'c12ef342000a353dfac8ffdd06d0546a',
    'weathermaps': '826f03b87b852612f6473385f6b2b9b9',
    'air-pollution': '6c4d30ec18f9f67811a99d1bbaf89e4f',
    'geocoding-api': '1a571ec1d115177b65ef8c6b448b60cd',
  };

  Map urlKeyWords = {
    'current': 'weather',
    'forecast5': 'forecast',
    'air-pollution': 'air_pollution',
  };

  /// https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
  /// https://api.openweathermap.org/data/2.5/forecast?q={city name}&appid={API key}
  /// http://api.openweathermap.org/data/2.5/air_pollution?lat={lat}&lon={lon}&appid={API key}
  /// http://api.openweathermap.org/geo/1.0/direct?q={city name},{state code},{country code}&limit={limit}&appid={API key}

  /// https://openweathermap.org/weathermap?basemap=map&cities=false&layer=temperature&lat=28.6496&lon=77.2421&zoom=10
  ///
  /// https://openweathermap.org/weathermap?basemap=map&cities=true&layer=temperature&lat=28.6496&lon=77.2421&zoom=10
  /// https://openweathermap.org/weathermap?basemap=map&cities=true&layer=pressure&lat=28.6496&lon=77.2421&zoom=10
  /// https://openweathermap.org/weathermap?basemap=map&cities=true&layer=windspeed&lat=28.6496&lon=77.2421&zoom=10
  /// https://openweathermap.org/weathermap?basemap=map&cities=true&layer=clouds&lat=28.6496&lon=77.2421&zoom=10
  /// https://openweathermap.org/weathermap?basemap=map&cities=true&layer=radar&lat=28.6496&lon=77.2421&zoom=3
  ///

  // void dummyTimer() {
  //   Future.delayed(Duration(seconds: 5), () {
  //     print("Future function is called after 5 sect");
  //   });
  //   print("DummyTimerFunction");
  // }

// in new version the async fucntion and the return type of the function is void then
// we have to use as shown below Future<void> functionName() async(){}
  Future<void> dummyTimer() async {
    await Future.delayed(Duration(seconds: 5), () {
      print("Future function is called after 5 sect");
      username = 'Balasundaram Karthik Kumar';
    });
    print("DummyTimerFunction");
  }

  void getApiData() async {
    Response apiResponse =
        await get(Uri.parse("https://dummyjson.com/products/1"));
    print(apiResponse.body);
    Map mappedData = jsonDecode(apiResponse.body);
    print(mappedData['description']);
    // in the above line body of the response is given and printed while feteching the data from the api url takes it own time
  }

  void getUserName() async {
    await dummyTimer();
    print('The user name is $username');
  }
/**
 * Below code will is for the weather api and its data
 */

  void _getLati_Long() async {}

  void getWeatherData() async {
    URLadditions = 'current';
    // weather?q={city name}&appid={API key}
    extraURLaddiotions = urlKeyWords[URLadditions] +
        '?q=Delhi,In&appid=' +
        apikeys[URLadditions];
    String weatherURL = weatherAPIurl + extraURLaddiotions;
    Response weatherApiResponse = await get(Uri.parse(weatherURL));
    Map completeData = jsonDecode(weatherApiResponse.body);
    Map mainTemp = completeData['main'];
    print(completeData);
    List weatherData = completeData['weather'];
    Map completeWeatherData = weatherData[0];
    print(completeWeatherData['main']);
  }

  /* 
  the below function is called when the widget is initlized like when we are coming back to 
  home page from any other page
  */
  @override
  void initState() {
    super.initState();
    getUserName();
    print("This is the init state for mausam home screen");
    // getApiData();
    getWeatherData();
  }

  /* 
  the below function is called when the widget is updated on a button click or some event like that
  hovering etc
  */
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set function of the widget get called");
    print("$counter");
  }

  /* 
  the below function is called when the widget is destroyed or disposed like when we are goin back to 
  some other pages or some other section .
  This method is always calle in the backend by default, we can override as shown below
  
  */
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget Destroyed with counter value $counter");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Welcome to the Mausam App",
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            "Home Page",
          ),
          FloatingActionButton(
            onPressed: () => setState(
              () {
                counter *= 5;
              },
            ),
          ),
          Text(
            '$counter',
          ),
        ],
      ),
    );
  }
}
