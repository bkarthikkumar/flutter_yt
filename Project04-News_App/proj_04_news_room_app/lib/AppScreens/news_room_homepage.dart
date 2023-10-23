import 'package:carousel_slider/carousel_slider.dart';
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
  final List colorsItems = [
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.redAccent,
    Colors.deepOrange,
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
                newsCatsMainSection(newsCats),
                // slider code
                homePageSlider(colorsItems),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget newsCatsMainSection(newsCategories) {
  return Container(
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
    child: newsCatsChildSection(newsCategories),
  );
}

Widget newsCatsChildSection(newsChild) {
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: newsChild.length,
    itemBuilder: ((context, index) {
      return InkWell(
        onTap: () {
          print(newsChild[index]);
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
              newsChild[index],
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

Widget homePageSlider(colorsItems) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: InkWell(
      onTap: () {},
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
        // items: [1, 2, 3, 4, 5].map((i) {
        items: colorsItems.map<Widget>((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: i),
                child: Text("Text $i"),
              );
            },
          );
        }).toList(),
      ),
    ),
  );
}
