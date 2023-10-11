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
                  padding: const EdgeInsets.only(right: 2.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.yellowAccent,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Balasundaram Karthik",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "Fullstack Developer",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.school_sharp,
                          size: 50,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "Education Details",
                          style: TextStyle(fontSize: 22),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.file_copy_outlined,
                          size: 50,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "Projects Done",
                          style: TextStyle(fontSize: 22),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.pin_drop,
                          size: 50,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "Prefredd Location",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email_rounded,
                          size: 50,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 50,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "Phone Number",
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Text(
                    "About Me",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  "Created By KSK",
                  style: TextStyle(fontSize: 15),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
