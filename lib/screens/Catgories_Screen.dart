import 'package:flutter/material.dart';
import 'package:meal_app/dummy.dart';
import 'package:meal_app/widget/Category_item.dart';

class CatgoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      children: DUMY_CATEGORIES
          .map(
            (catDate) => CategoryItem(catDate.id, catDate.title, catDate.color),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
