import 'package:flutter/material.dart';

class MausamHome extends StatefulWidget {
  const MausamHome({super.key});

  @override
  State<MausamHome> createState() => _MausamHomeState();
}

class _MausamHomeState extends State<MausamHome> {
  /* 
  the below function is called when the widget is initlized like when we are coming back to 
  home page from any other page
  */
  @override
  void initState() {
    super.initState();
    print("This is the init state for mausam home screen");
  }

  int counter = 1;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set function of the widget get called");
    print("$counter");
  }

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
