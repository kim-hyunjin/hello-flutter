import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: meal.imageUrl,
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
