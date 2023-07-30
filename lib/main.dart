import 'package:flutter/material.dart';
import 'package:meal_app/dummy.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/filiters_Screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_Screen.dart';
import 'screens/Category_Meal_Screen.dart';

import 'screens/Catgories_Screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setfilters(Map<String, bool> _filterDate) {
    setState(() {
      _filters = _filterDate;
      _availableMeals = DUMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final exitingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (exitingIndex >= 0) {
      setState(() {
        _favouriteMeals.remove(exitingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(DUMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        highlightColor: const Color.fromARGB(170, 255, 193, 7),
        canvasColor: Colors.white30,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/': (context) => TabsScreen(_favouriteMeals),
        CategoryMealScreen.routename: (context) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavourite),
        FilterScreen.routename: (context) =>
            FilterScreen(_setfilters, _filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meal App"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body:
            CatgoriesScreen() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
