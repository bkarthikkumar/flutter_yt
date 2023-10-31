import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:proj_04_news_room_app/NewsModel/news_model.dart';

class CategorySearchNews extends StatefulWidget {
  // const CategorySearchNews({super.key});
  String cateQuery;
  CategorySearchNews({required this.cateQuery});
  getName(name) {
    print(name);
  }

  @override
  State<CategorySearchNews> createState() => _CategorySearchNewsState();
}

class _CategorySearchNewsState extends State<CategorySearchNews> {
  TextEditingController newsRoomController = TextEditingController();

  String appKey = '5721568e097a4476b118ba7da73f06ce';
  String newsAppUrl = ',';
  List<NewsModel> newsArticles = <NewsModel>[];
  List<String> newsCats = [
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
  List<String> countriesName = [
    'ae',
    'ar',
    'at',
    'au',
    'be',
    'bg',
    'br',
    'ca',
    'ch',
    'cn',
    'co',
    'cu',
    'cz',
    'de',
    'eg',
    'fr',
    'gb',
    'gr',
    'hk',
    'hu',
    'id',
    'ie',
    'il',
    'in',
    'it',
    'jp',
    'kr',
    'lt',
    'lv',
    'ma',
    'mx',
    'my',
    'ng',
    'nl',
    'no',
    'nz',
    'ph',
    'pl',
    'pt',
    'ro',
    'rs',
    'ru',
    'sa',
    'se',
    'sg',
    'si',
    'sk',
    'th',
    'tr',
    'tw',
    'ua',
    'us',
    've',
    'za'
  ];
  final List colorsItems = [
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.redAccent,
    Colors.deepOrange,
  ];

  bool isDataLoading = true;
  getNewsData(searchQuery) async {
    newsAppUrl =
        'https://newsapi.org/v2/everything?q=$searchQuery&apiKey=$appKey';
    print(newsAppUrl);
    Response newsDataresponse = await get(Uri.parse(newsAppUrl));
    Map completeData = jsonDecode(newsDataresponse.body);

    // log(completeData.toString());
    setState(() {
      completeData['articles'].forEach((singleNewArticle) {
        NewsModel singleNews = new NewsModel();
        singleNews = NewsModel.fromMap(singleNewArticle);
        newsArticles.add(singleNews);
        // print(newsArticles);
        setState(() {
          isDataLoading = false;
        });
      });
    });

    // print(newsArticles);
  }

  getCountryCatNews({country = '', category = ''}) async {
    if (category != '') {
      newsAppUrl =
          'https://newsapi.org/v2/everything?q=$category&apiKey=$appKey';
    } else if (country != '') {
      newsAppUrl =
          'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$appKey';
    } else {
      final _random = new Random();
      var countryName = countriesName[_random.nextInt(countriesName.length)];
      var randCats = newsCats[_random.nextInt(newsCats.length)].toLowerCase();
      newsAppUrl =
          'https://newsapi.org/v2/top-headlines?country=$countryName&category=$randCats&apiKey=$appKey';
    }

    print(newsAppUrl);
    Response newsDataresponse = await get(Uri.parse(newsAppUrl));
    Map completeData = jsonDecode(newsDataresponse.body);

    // log(completeData.toString());
    setState(() {
      completeData['articles'].forEach((singleNewArticle) {
        NewsModel singleNews = new NewsModel();
        singleNews = NewsModel.fromMap(singleNewArticle);
        newsArticles.add(singleNews);
        // print(newsArticles);
        setState(() {
          isDataLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getNewsData(widget.cateQuery);
  }

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
                            if (newsRoomController.text == ',' ||
                                (newsRoomController.text).trim() == ',') {
                              print("Blank data");
                              (newsRoomController.text).replaceAll(" ", "");
                            } else {
                              print(newsRoomController.text);
                              Navigator.push(
                                context,
                                (MaterialPageRoute(
                                  builder: (context) => CategorySearchNews(
                                      cateQuery: newsRoomController.text
                                          .trim()
                                          .toString()
                                          .toLowerCase()),
                                )),
                              );
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
                            Navigator.push(
                              context,
                              (MaterialPageRoute(
                                builder: (context) => CategorySearchNews(
                                    cateQuery:
                                        value.trim().toString().toLowerCase()),
                              )),
                            );
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
                countriesSection(countriesList: countriesName),
                // slider code
                // homePageSlider(newsArticles),
                rowSeprator(),

                appHeadings(appheadingText: widget.cateQuery),
                isDataLoading ? dataLoader() : newsItemsList(newsArticles),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget dataLoader() {
  return SpinKitChasingDots(
    color: Colors.blueAccent,
    size: 150.0,
  );
}

Widget appHeadings({appheadingText}) {
  return Container(
    child: Center(
      child: Text(
        appheadingText.toString().toUpperCase(),
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget rowSeprator() {
  return Container(
    padding: EdgeInsets.only(
      top: 5,
      bottom: 20,
    ),
    child: Divider(
      height: 2,
      thickness: 0.8,
      indent: 20,
      endIndent: 20,
      color: Colors.black.withOpacity(0.8),
    ),
  );
}

Widget newsCatsMainSection(newsCategories) {
  return Container(
    height: 75,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          width: 1.5,
          color: Colors.grey,
        ),
        bottom: BorderSide(
          width: 1.5,
          color: Colors.grey,
        ),
      ),
      gradient: LinearGradient(
        stops: [
          0.1,
          0.9,
        ],
        colors: [
          Colors.white12,
          Colors.yellow,
        ],
      ),
    ),
    child: newsCatsChildSection(newsCategories),
  );
}

Widget countriesSection({countriesList}) {
  return Container(
    height: 75,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          width: 1.5,
          color: Colors.grey,
        ),
        bottom: BorderSide(
          width: 1.5,
          color: Colors.grey,
        ),
      ),
      gradient: LinearGradient(
        stops: [
          0.1,
          0.5,
        ],
        colors: [
          Colors.yellow,
          Colors.white12,
        ],
      ),
    ),
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: countriesList.length,
      itemBuilder: ((context, index) {
        return InkWell(
          onTap: () {
            print(countriesList[index]);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            margin: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
            child: CountryFlag.fromCountryCode(
              countriesList[index],
              height: 25,
              width: 30,
              borderRadius: 8,
            ),
          ),
        );
      }),
    ),
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
          print(newsChild[index].toString().toLowerCase());
          Navigator.pushReplacement(
            context,
            (MaterialPageRoute(
              builder: (context) => CategorySearchNews(
                  cateQuery: newsChild[index].toString().toLowerCase()),
            )),
          );
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

Widget homePageSlider(newsArticles) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: 5,
      vertical: 15,
    ),
    child: InkWell(
      onTap: () {},
      child: CarouselSlider(
        options: CarouselOptions(
          height: 250,
          // aspectRatio: 16 / 9,
          // viewportFraction: 0.75,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          // enlargeCenterPage: true,
          // enlargeFactor: 0.8,
          scrollDirection: Axis.horizontal,
        ),
        // items: [1, 2, 3, 4, 5].map((i) {
        items: newsArticles.map<Widget>((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                // decoration: BoxDecoration(color: i),
                child: Column(
                  children: [
                    ImageSection(i.newsImage, 'url'),
                    // Text(i.newsHeading),
                  ],
                ),
                // child: newsItemsList(),
              );
            },
          );
        }).toList(),
      ),
    ),
  );
}

Widget ImageSection(imageUrl, imgSrc) {
  var returnObj;
  if (imageUrl == null) {
    return Image.asset('assets/images/noImage.jpg');
  }
  switch (imgSrc) {
    case 'url':
      returnObj = Image.network(
        imageUrl,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/images/noImage.jpg',
            fit: BoxFit.contain,
          );
        },
      );
      break;
    case 'static':
      returnObj = Image.asset('assets/images/$imageUrl');
      break;
    default:
      returnObj = Image.asset('assets/images/noImage.jpg');
  }
  return returnObj;
}

Widget newsItemsList(latestNewsArticles) {
  return Container(
    child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: latestNewsArticles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Card(
              elevation: 10.8,
              child: Stack(
                children: [
                  Column(
                    children: [
                      ImageSection(latestNewsArticles[index].newsImage, 'url'),
                      rowSeprator(),
                      // postionContainer(),
                      newsTitle_Subtitle(
                        headingText: latestNewsArticles[index].newsHeading,
                        subheadingText: latestNewsArticles[index].newsDesc,
                        author: latestNewsArticles[index].newsAuthor,
                      ),
                      readMoreButton(
                          newsUrl: latestNewsArticles[index].newsUrl),
                    ],
                  ),
                  postionContainer(
                      news_Source: latestNewsArticles[index]
                          .newsSourceName) // pass the news source name
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget postionContainer({news_Source = ','}) {
  return Positioned(
    left: 10,
    top: 10,
    child: Container(
      width: 150,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        color: Colors.black.withOpacity(0.65),
      ),
      child: Column(children: [
        Text(
          "By $news_Source",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ]),
    ),
  );
}

Widget newsTitle_Subtitle({headingText, subheadingText, author = ','}) {
  if (subheadingText == null) {
    subheadingText = "N/A";
  }
  if (headingText == null) {
    headingText = "N/A";
  }
  return ListTile(
    leading: Icon(Icons.local_fire_department_sharp),
    title: Text(
      headingText,
      style: TextStyle(
        fontFamily: 'heading-text',
        fontSize: 25,
        color: Colors.black,
      ),
    ),
    horizontalTitleGap: 5,
    minVerticalPadding: 10,
    subtitle: Text(
      subheadingText,
      style: TextStyle(
        // fontFamily: 'body-text',
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
    ),
    trailing: Text(
      author,
      style: TextStyle(
        // fontFamily: 'body-text',
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
    ),
  );
}

Widget readMoreButton({newsUrl}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              print("Go to url : $newsUrl");
            },
            child: Text("Read More..."),
          ),
        ),
      ],
    ),
  );
}
