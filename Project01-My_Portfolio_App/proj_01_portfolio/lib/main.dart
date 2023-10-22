import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

// https://youtu.be/noTXPpUADdg?feature=shared --- Youtube  Link for PRoject 001
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Welcome to the Portfolio App",
            style: TextStyle(fontFamily: "DancingScript"),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'asset/images/dark_bg.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          // padding: const EdgeInsets.all(50.0),
          padding: const EdgeInsets.only(top: 30.0, left: 10.0),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage("asset/images/profile_001.jpg"),
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
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Fullstack Developer",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
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
                            color: Colors.white,
                            size: 50,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "Education Details",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "DancingScript",
                            ),
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
                            color: Colors.white,
                            size: 50,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "Projects Done",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
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
                            color: Colors.white,
                            size: 50,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "Prefredd Location",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
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
                            color: Colors.white,
                            size: 50,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 50,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "Phone Number",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Text(
                      "About Me",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Text(
                    "Created By KSK",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
