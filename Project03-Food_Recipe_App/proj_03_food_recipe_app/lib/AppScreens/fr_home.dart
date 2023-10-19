import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:proj_03_food_recipe_app/FoodRecipeModel/recipe_model.dart';

class FoodRecipeHome extends StatefulWidget {
  const FoodRecipeHome({super.key});

  @override
  State<FoodRecipeHome> createState() => _FoodRecipeHomeState();
}

String appId = '639ee0b3';
String appKey = 'f11f737334c5708abca4f04a6acb1e79';
String appUrl = '';
// 'https://api.edamam.com/api/recipes/v2?type=public&q=rajma&app_id=639ee0b3&app_key=f11f737334c5708abca4f04a6acb1e79';

class _FoodRecipeHomeState extends State<FoodRecipeHome> {
  TextEditingController foodSearchTextController = new TextEditingController();
  List<FoodRecipeModel> appFoodRecipeList = <FoodRecipeModel>[];

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
    });

    appFoodRecipeList.forEach((dataRecipe) {
      print(dataRecipe.appLabel);
      print(dataRecipe.appIngredientList);
    });
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
                                getFoodRecipe(foodSearchTextController.text);
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
                          "WHAT DO YOU WANT TO COOK TODAY?",
                          style: TextStyle(
                            fontSize: 33,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Let's Cook Something New!",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 150,
                      itemBuilder: (context, index) {
                        return Text("Hello index $index");
                      },
                    ),
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
