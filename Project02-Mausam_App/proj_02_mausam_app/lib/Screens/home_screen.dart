import 'package:flutter/material.dart';
import 'package:proj_02_mausam_app/DataFetcher/api_config.dart';

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
            backgroundColor: Colors.red,
            onPressed: () => setState(
              () {},
            ),
          ),
          TextButton(
            onPressed: () => setState(
              () {
                print(dataRecived);
              },
            ),
            child: Text("Click me!!"),
          )
        ],
      ),
    );
  }
}
