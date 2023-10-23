import 'package:flutter/material.dart';

class NewsroomHome extends StatefulWidget {
  const NewsroomHome({super.key});

  @override
  State<NewsroomHome> createState() => _NewsroomHomeState();
}

class _NewsroomHomeState extends State<NewsroomHome> {
  TextEditingController newsRoomController = TextEditingController();
  List<String> newsCats = [
    'India',
    'World',
    'Business and Finance',
    'Cars',
    'Entertainment',
    'Family',
    'Health',
    'Politics',
    'Religion',
    'Science and Technology',
    'Sports',
    'Travel',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("NEWS ROOM APP"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            if (newsRoomController.text == '' ||
                                (newsRoomController.text).trim() == '') {
                              print("Blank data");
                              (newsRoomController.text).replaceAll(" ", "");
                            } else {
                              print(newsRoomController.text);
                              // Navigator.pushReplacementNamed(
                              //   context,
                              //   '/loading-location-data',
                              //   arguments: {'searchField': newsRoomController.text });
                              // print(dataRecived);
                              // print(searchFieldController.text);
                            }
                          },
                          child: Icon(
                            Icons.search,
                            size: 25,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: newsRoomController,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            print(value);
                          },
                          decoration: InputDecoration(
                            hintText: "Get Latest news...",
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      stops: [0.1, 0.9],
                      colors: [
                        Colors.white,
                        Colors.yellow,
                      ],
                    ),
                  ),
                  child: newsCatsSection(newsCats),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget newsCatsSection(newsCategories) {
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: newsCategories.length,
    itemBuilder: ((context, index) {
      return InkWell(
        onTap: () {
          print(newsCategories[index]);
        },
        child: Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              // border: Border.all(width: 0.5),
              color: Colors.blueAccent),
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Center(
            child: Text(
              newsCategories[index],
              style: TextStyle(
                fontFamily: 'heading-text',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
          ),
        ),
      );
    }),
  );
}
