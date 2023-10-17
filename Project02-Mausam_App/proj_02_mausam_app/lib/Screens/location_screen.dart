import 'package:flutter/material.dart';

class MausamLocations extends StatefulWidget {
  const MausamLocations({super.key});

  @override
  State<MausamLocations> createState() => _MausamLocationsState();
}

class _MausamLocationsState extends State<MausamLocations> {
  TextEditingController searchFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map errorMsg = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Center(
          child: Text(
            "Welcome to the Mausam App",
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // "CITY NOT Found",
                  errorMsg['error_msg'],
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/");
                    },
                    icon: Icon(Icons.home),
                    label: Text("Retun To Main Screen"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
