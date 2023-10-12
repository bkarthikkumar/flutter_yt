import 'package:flutter/material.dart';

class MausamHome extends StatefulWidget {
  const MausamHome({super.key});

  @override
  State<MausamHome> createState() => _MausamHomeState();
}

class _MausamHomeState extends State<MausamHome> {
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
      body: Text("Home Page"),
    );
  }
}
