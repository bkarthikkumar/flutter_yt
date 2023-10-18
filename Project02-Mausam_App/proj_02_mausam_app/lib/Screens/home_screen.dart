import 'dart:math';

import 'package:flutter/material.dart';
import 'package:proj_02_mausam_app/DataFetcher/api_config.dart';

class MausamHome extends StatefulWidget {
  const MausamHome({super.key});

  @override
  State<MausamHome> createState() => _MausamHomeState();
}

class _MausamHomeState extends State<MausamHome> {
  TextEditingController searchFieldController = new TextEditingController();
  /* 
  the below function is called when the widget is initlized like when we are coming back to 
  home page from any other page
  */
  @override
  void initState() {
    super.initState();
    print("This is the init state for mausam home screen");
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
  }

  @override
  Widget build(BuildContext context) {
    Map dataRecived = ModalRoute.of(context)!.settings.arguments as Map;
    print(dataRecived);
    var apiResponseMessage = dataRecived['apiResponseMessage'];
    String weather = dataRecived['weather'];
    String weatherDesc = dataRecived['weatherDesc'];
    String temp = dataRecived['temp'];
    String feelsLike = dataRecived['feelsLike'];
    String pressure = dataRecived['pressure'];
    String humidity = dataRecived['humidity'];
    String sunRise = dataRecived['sunRise'];
    String sunSet = dataRecived['sunSet'];
    String windSpeed = dataRecived['windSpeed'];
    String windDeg = dataRecived['windDeg'];
    String cloudStatus = dataRecived['cloudStatus'];
    String currentDate = dataRecived['currentDate'];
    String weatherICon = dataRecived['weatherICon'];
    String searchedLocation = dataRecived['searchedLocation'];
    String iconUrl = "https://openweathermap.org/img/wn/$weatherICon@2x.png";

    if (apiResponseMessage.isNotEmpty) {
      // Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/select-location',
          arguments: {'error_msg': apiResponseMessage});
      // });
    }

    var sampleSearch = ['Delhi', 'Tamil Nadu', 'Goa', 'Pune'];
    final _random = new Random();
    var city = sampleSearch[_random.nextInt(sampleSearch.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Center(
          child: Text(
            "Welcome to the Mausam App",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [
                  0.3,
                  // 0.3,
                  // 0.6,
                  0.9,
                ],
                colors: [
                  Colors.red,
                  Colors.yellow,
                  // Colors.lightBlue,
                  // Colors.deepPurple,
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  // Start of search container
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchFieldController,
                          decoration: InputDecoration(
                            hintText: "Please Enter Location Like $city",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            if (searchFieldController.text == '' ||
                                (searchFieldController.text).trim() == '') {
                              print("Blank data");
                              (searchFieldController.text).replaceAll(" ", "");
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, '/loading-location-data',
                                  arguments: {
                                    'searchField': searchFieldController.text
                                  });
                              // print(dataRecived);
                              // print(searchFieldController.text);
                            }
                          },
                          child: Icon(Icons.search),
                        ),
                      ),
                      // Text("Please Enter The Location"),
                    ],
                  ),
                ), // End of search container
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  iconUrl,
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      weatherDesc.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "in $searchedLocation",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 280,
                        padding: EdgeInsets.all(25),
                        margin: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.thermostat,
                                      size: 35,
                                    ),
                                    Text(
                                      "Today Temperature",
                                      style: TextStyle(
                                        fontFamily: 'Satisfy',
                                        fontSize: 35,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      temp,
                                      style: TextStyle(fontSize: 85),
                                    ),
                                    Text(
                                      "C",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 180,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        margin: EdgeInsets.fromLTRB(15, 20, 25, 0),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.storm,
                                ),
                                Text(
                                  "Humidity",
                                  style: TextStyle(
                                    fontFamily: 'HomemadeApple',
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  humidity,
                                  style: TextStyle(
                                    fontSize: 45,
                                  ),
                                ),
                                Text(
                                  "%",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 180,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        margin: EdgeInsets.fromLTRB(15, 20, 25, 0),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.storm),
                                Text(
                                  "Wind Speed",
                                  style: TextStyle(
                                    fontFamily: 'HomemadeApple',
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              windSpeed,
                              style: TextStyle(
                                fontSize: 45,
                              ),
                            ),
                            Text(
                              "Km/hr",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        color: Colors.black.withOpacity(0.2),
                        child: Column(
                          children: [
                            Text(
                              "By Balasundaram Karthik Kumar",
                              style: TextStyle(
                                  fontFamily: 'Satisfy',
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "API by openweatherapp",
                              style: TextStyle(
                                  fontFamily: 'Satisfy',
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
