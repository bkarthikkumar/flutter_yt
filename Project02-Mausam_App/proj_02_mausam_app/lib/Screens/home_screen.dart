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

  /* 
  the below function is called when the widget is initlized like when we are coming back to 
  home page from any other page
  */
  @override
  void initState() {
    super.initState();
    getUserName();
    print("This is the init state for mausam home screen");
    getApiData();
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
