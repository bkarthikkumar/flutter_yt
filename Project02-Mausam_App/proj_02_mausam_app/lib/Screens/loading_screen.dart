import 'package:flutter/material.dart';

class MausamLoading extends StatefulWidget {
  const MausamLoading({super.key});

  @override
  State<MausamLoading> createState() => _MausamLoadingState();
}

class _MausamLoadingState extends State<MausamLoading> {
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
        child: Column(
          children: [
            Text(
              "Mausam Loading Page",
            ),
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                icon: Icon(Icons.home),
                label: Text("Retun To Main Screen"))
          ],
        ),
      ),
    );
  }
}
