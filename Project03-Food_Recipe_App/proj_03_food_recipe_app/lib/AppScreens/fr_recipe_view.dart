import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeWebView extends StatefulWidget {
  // const RecipeWebView({super.key});
  String recipeURL;
  String recipeName;
  RecipeWebView({required this.recipeURL, required this.recipeName});

  @override
  State<RecipeWebView> createState() => _RecipeWebViewState();
}

class _RecipeWebViewState extends State<RecipeWebView> {
  late final WebViewController foodRecipeViewController;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    foodRecipeViewController = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse(widget.recipeURL),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipeName),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: WebViewWidget(
          controller: foodRecipeViewController,
        ),
      ),
    );
  }
}
