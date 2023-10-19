class FoodRecipeModel {
  String? appLabel;
  String? appImage;
  String? appSource;
  String? appCalories;
  String? appSourceUrl;
  List? appIngredientList;
  List? appDietLabels;
  List? appHealthLabels;
  Map? appTotalNutrients;
  String? appTotalTime;
  List? appIngredients;
  // constructor
  FoodRecipeModel({
    this.appLabel,
    this.appImage,
    this.appSource,
    this.appCalories,
    this.appSourceUrl,
    this.appIngredientList,
    this.appDietLabels,
    this.appHealthLabels,
    this.appTotalNutrients,
    this.appTotalTime,
    this.appIngredients,
  });
  factory FoodRecipeModel.fromMap(Map foodRecipe) {
    return FoodRecipeModel(
      appLabel: foodRecipe['label'],
      appImage: foodRecipe['image'],
      appSource: foodRecipe['source'],
      appCalories: foodRecipe['calories'].toStringAsFixed(2),
      appSourceUrl: foodRecipe['url'],
      appIngredientList: foodRecipe['ingredientLines'],
      appDietLabels: foodRecipe['dietLabels'],
      appHealthLabels: foodRecipe['healthLabels'],
      appTotalNutrients: foodRecipe['totalNutrients'],
      appTotalTime: foodRecipe['totalTime'].toString(),
      appIngredients: foodRecipe['ingredients'],
    );
  }
}
