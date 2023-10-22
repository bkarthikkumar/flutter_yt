import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:proj_03_food_recipe_app/AppScreens/fr_search_recipe.dart';
import 'package:proj_03_food_recipe_app/FoodRecipeModel/recipe_model.dart';

import 'package:proj_03_food_recipe_app/AppScreens/fr_recipe_view.dart';

class FoodRecipeHome extends StatefulWidget {
  const FoodRecipeHome({super.key});

  @override
  State<FoodRecipeHome> createState() => _FoodRecipeHomeState();
}

class _FoodRecipeHomeState extends State<FoodRecipeHome> {
  bool isDataLoading = true;

  String appId = '639ee0b3';
  String appKey = 'f11f737334c5708abca4f04a6acb1e79';
  String appUrl = '';
// 'https://api.edamam.com/api/recipes/v2?type=public&q=rajma&app_id=639ee0b3&app_key=f11f737334c5708abca4f04a6acb1e79';

  TextEditingController foodSearchTextController = new TextEditingController();
  List<FoodRecipeModel> appFoodRecipeList = <FoodRecipeModel>[];
  List reciptCatList = [
    {
      "imgUrl": "https://images.unsplash.com/photo-1593560704563-f176a2eb61db",
      "heading": "Vegetarian and vegan",
      "value": "vegetarians",
    },
    {
      "imgUrl": "https://images.unsplash.com/photo-1593560704563-f176a2eb61db",
      "heading": "Non-Vegetarian",
      "value": 'non-vegetarian',
    },
    {
      "imgUrl": "https://images.unsplash.com/photo-1593560704563-f176a2eb61db",
      "heading": "Snacks",
      "value": 'snacks'
    },
    {
      "imgUrl": "https://images.unsplash.com/photo-1593560704563-f176a2eb61db",
      "heading": "Street Food",
      "value": 'street food',
    }
  ];

  var randomFoodsFrHomePage = [
    'indian',
    'mexican',
    'pasta',
    'south-indian',
    'rajasthani',
    'indian-street-food',
  ];
// get recipe data from api

  getFoodRecipe(foodQuery) async {
    appUrl =
        'https://api.edamam.com/api/recipes/v2?type=public&app_id=$appId&app_key=$appKey&q=$foodQuery';
    Response foodApiResponse = await get(Uri.parse(appUrl));
    Map foodApiData = jsonDecode(foodApiResponse.body);
    // print(foodApiData);

    foodApiData['hits'].forEach((apiData) {
      FoodRecipeModel foodApi_recipeModel = new FoodRecipeModel();
      foodApi_recipeModel = FoodRecipeModel.fromMap(apiData['recipe']);
      appFoodRecipeList.add(foodApi_recipeModel);
      setState(() {
        isDataLoading = false;
        print(isDataLoading);
      });
    });
    print(isDataLoading);
    // appFoodRecipeList.forEach((dataRecipe) {
    //   print(dataRecipe.appLabel);
    //   // print(dataRecipe.appIngredientList);
    // });
  }

  randomHomePageFood() {
    final _random = new Random();
    var homeFood =
        randomFoodsFrHomePage[_random.nextInt(randomFoodsFrHomePage.length)];
    return homeFood;
  }

  @override
  void initState() {
    super.initState();
    getFoodRecipe(randomHomePageFood());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Zyaka-Food Recipe",
      //   ),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0.2,
                    0.9,
                  ],
                  colors: [
                    Colors.lime,
                    Colors.teal,
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // Start of search container
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: foodSearchTextController,
                            decoration: InputDecoration(
                              hintText: "Feeling hungrrry!!!",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: GestureDetector(
                            onTap: () {
                              if (foodSearchTextController.text == '' ||
                                  (foodSearchTextController.text).trim() ==
                                      '') {
                                print("Blank data");
                                (foodSearchTextController.text)
                                    .replaceAll(" ", "");
                              } else {
                                // getFoodRecipe(foodSearchTextController.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchFoodRecipe(
                                        foodSearchTextController.text),
                                  ),
                                );
                              }
                            },
                            child: Icon(Icons.search),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What do you want to try today?",
                          style: TextStyle(
                            fontSize: 30.5,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          child: recipeCategory(reciptCatList),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Let's Cook Something New!",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  getFoodRecipe(randomHomePageFood());
                                });
                              },
                              child: Text(
                                "Hit me",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: isDataLoading
                        ? CircularProgressIndicator()
                        : recipeListData(appFoodRecipeList),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget recipeListData(passedApiList) {
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: passedApiList.length,
    itemBuilder: ((context, index) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeWebView(
                recipeURL: passedApiList[index].appSourceUrl,
                recipeName: passedApiList[index].appLabel,
              ),
            ),
          );
        },
        child: Card(
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 5.0,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  passedApiList[index].appImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
              ),
              Positioned(
                bottom: 15,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: Text(
                    passedApiList[index].appLabel,
                    // passedApiList[index].appSourceUrl,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                height: 50,
                width: 120,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    color: Colors.black.withOpacity(0.7),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.white,
                      ),
                      Text(
                        passedApiList[index].appCalories,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 5,
                top: 5,
                height: 50,
                width: 125,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    color: Colors.black.withOpacity(0.7),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.punch_clock,
                        color: Colors.white,
                      ),
                      Text(
                        '${passedApiList[index].appTotalTime} min',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }),
  );
}

Widget recipeCategory(passedCatList) {
  return ListView.builder(
    itemCount: passedCatList.length,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Container(
        child: InkWell(
          onTap: () {
            print(passedCatList[index]["value"]);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SearchFoodRecipe(passedCatList[index]["value"]),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 10.0,
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.network(
                      passedCatList[index]["imgUrl"],
                      fit: BoxFit.cover,
                      width: 250,
                      height: 200,
                    )),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          passedCatList[index]["heading"],
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
