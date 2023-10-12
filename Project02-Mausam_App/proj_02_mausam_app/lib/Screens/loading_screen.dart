import 'package:flutter/material.dart';

class MausamLoading extends StatefulWidget {
  const MausamLoading({super.key});

  @override
  State<MausamLoading> createState() => _MausamLoadingState();
}

class _MausamLoadingState extends State<MausamLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "Mausam Loading Page",
      ),
    );
  }
}
