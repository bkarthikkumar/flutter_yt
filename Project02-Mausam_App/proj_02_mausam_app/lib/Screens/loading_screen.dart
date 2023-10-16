import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:proj_02_mausam_app/DataFetcher/api_config.dart';

class MausamLoading extends StatefulWidget {
  const MausamLoading({super.key});

  @override
  State<MausamLoading> createState() => _MausamLoadingState();
}

class _MausamLoadingState extends State<MausamLoading> {
  String temp = "Please Wait while we fetching the data";
  Map apiDataToBeSent = {};
  void initWeatherApp() async {
    ApiData appData = ApiData(location: 'Delhi,In', typeOfData: 'current');
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
    // initWeatherApp();
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
      body: SafeArea(
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
      backgroundColor: Colors.lightBlueAccent[200],
    );
  }
}
