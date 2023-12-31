import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:proj_03_food_recipe_app/AppScreens/fr_recipe_view.dart';
import 'package:proj_03_food_recipe_app/FoodRecipeModel/recipe_model.dart';

class SearchFoodRecipe extends StatefulWidget {
  // const SearchFoodRecipe({super.key});
  late String searchQuery;
  SearchFoodRecipe(this.searchQuery);

  @override
  State<SearchFoodRecipe> createState() => _SearchFoodRecipeState();
}

class _SearchFoodRecipeState extends State<SearchFoodRecipe> {
  bool isDataLoading = true;

  TextEditingController foodSearchTextController = new TextEditingController();
  List<FoodRecipeModel> appFoodRecipeList = <FoodRecipeModel>[];

// get recipe data from api
  String appId = '639ee0b3';
  String appKey = 'f11f737334c5708abca4f04a6acb1e79';
  String appUrl = '';

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
      });
    });

    // appFoodRecipeList.forEach((dataRecipe) {
    //   print(dataRecipe.appLabel);
    //   // print(dataRecipe.appIngredientList);
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFoodRecipe(widget.searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                Navigator.pushReplacement(
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
                  isDataLoading
                      ? CircularProgressIndicator()
                      : totalSearchResultCount(
                          appFoodRecipeList, foodSearchTextController.text),
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

Widget totalSearchResultCount(passedApiList, queryText) {
  return Container(
    child: Text(
      "${passedApiList.length} result are found",
      style: TextStyle(
        fontSize: 25,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
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
                width: 130,
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
          onTap: () {},
          child: Card(
            margin: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 0.0,
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.network(
                      passedCatList[index]["imgUrl"],
                      fit: BoxFit.cover,
                      width: 200,
                      height: 250,
                    )),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(color: Colors.black26),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          passedCatList[index]["heading"],
                          style: TextStyle(color: Colors.white, fontSize: 28),
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
