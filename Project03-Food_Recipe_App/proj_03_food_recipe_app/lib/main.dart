import 'package:flutter/material.dart';
import 'package:proj_03_food_recipe_app/AppScreens/fr_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'satisfyFamily',
        primarySwatch: Colors.deepOrange,
      ),
      home: FoodRecipeHome(),
    );
  }
}

// edamamflutter@yopmail.com
// ktzGUn4zHZn!TLx
// https://api.edamam.com/api/recipes/v2?type=public&q=rajma&app_id=639ee0b3&app_key=f11f737334c5708abca4f04a6acb1e79
/// in the above url q is for query
/// app id and  app key from the edamam apis