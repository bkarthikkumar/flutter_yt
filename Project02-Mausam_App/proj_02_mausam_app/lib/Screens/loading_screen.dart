import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:proj_02_mausam_app/DataFetcher/api_config.dart';

class MausamLoading extends StatefulWidget {
  const MausamLoading({super.key});

  @override
  State<MausamLoading> createState() => _MausamLoadingState();
}

class _MausamLoadingState extends State<MausamLoading> {
  String _golocation = 'Delhi,In';
  String temp = "Please Wait while we fetching the data";
  Map apiDataToBeSent = {};
  void initWeatherApp(String _golocation) async {
    print(_golocation);
    ApiData appData = ApiData(location: _golocation, typeOfData: 'current');
    await appData.getWeatherData();
    // print(appData.customWeatherData);
    apiDataToBeSent.addAll(appData.customWeatherData);
    // this has a drawbac as the we go back the loading or the previous route will be visible to overcome that we will be using different approach

    // Navigator.pushNamed(context, '/home');
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home',
          arguments: apiDataToBeSent);
    });

    // setState(() {
    //   temp = appData.humidity.toString();
    // });

    // print(appData.windSpeed);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Map searchLocation = ModalRoute.of(context)!.settings.arguments as Map;
    Map? searchLocation = ModalRoute.of(context)?.settings.arguments as Map?;

    if (searchLocation?.isNotEmpty ?? false) {
      _golocation = searchLocation!['searchField'];
      print(_golocation);
    }
    initWeatherApp(_golocation);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Welcome to the Mausam App",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome to Mausam App",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontFamily: "HomemadeApple"),
                ),
                Image.asset('assets/images/logo.png'),
                SpinKitWaveSpinner(
                  color: Colors.white,
                  size: 50.0,
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "Crafted by \n Balasundaram Karthik Kumar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Satisfy',
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.lightBlueAccent[200],
    );
  }
}
