import 'package:flutter/material.dart';

class FoodRecipeHome extends StatefulWidget {
  const FoodRecipeHome({super.key});

  @override
  State<FoodRecipeHome> createState() => _FoodRecipeHomeState();
}

class _FoodRecipeHomeState extends State<FoodRecipeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Zyaka-Food Recipe",
        ),
      ),
      body: Text(
        "Hello Karthik -- From AppScreen/fr_home",
      ),
    );
  }
}
