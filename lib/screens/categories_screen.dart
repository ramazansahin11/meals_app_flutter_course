import 'package:flutter/material.dart';
import 'package:meals_app_flutter_course/models/category.dart';
import 'package:meals_app_flutter_course/models/dummy_data.dart';
import 'package:meals_app_flutter_course/models/meal.dart';
import 'package:meals_app_flutter_course/screens/meals_screen.dart';
import 'package:meals_app_flutter_course/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredList = availableMeals
        .where((m) => m.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealsScreen(title: category.title, meals: filteredList);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        //availableCategories.map((category)=>CategoryGridItem(category:category)).toList() // same with for in
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectedCategory: () => _selectCategory(context, category),
          ),
      ],
    );
  }
}
