import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to the Portfolio App"),
      ),
      body: Padding(
        // padding: const EdgeInsets.all(50.0),
        padding: const EdgeInsets.only(top: 10.0, left: 10.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.yellowAccent,
                  ),
                ),
                Column(
                  children: [
                    Text("Balasundaram Karthik Kumar"),
                    Text("Fullstack Developer")
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
