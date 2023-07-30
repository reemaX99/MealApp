import 'package:flutter/material.dart';
import 'package:meal_app/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routename = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilter;

  const FilterScreen(this.saveFilters, this.currentFilter);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten']!;
    _LactoseFree = widget.currentFilter['lactose']!;
    _Vegan = widget.currentFilter['vegan']!;
    _Vegetarian = widget.currentFilter['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _LactoseFree,
                  'vegan': _Vegan,
                  'vegetarian': _Vegetarian,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text("Adjust your meal selection")),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                title: Text('Gluten-free'),
                value: _glutenFree,
                subtitle: Text("only include gluten- free meals"),
                onChanged: (bool value) {
                  setState(() {
                    _glutenFree = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Lactose-free'),
                value: _LactoseFree,
                subtitle: Text("only include Lactose-Free meals"),
                onChanged: (bool value) {
                  setState(() {
                    _LactoseFree = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegan'),
                value: _Vegan,
                subtitle: Text("only include Vegan meals"),
                onChanged: (bool value) {
                  setState(() {
                    _Vegan = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegetarian'),
                value: _Vegetarian,
                subtitle: Text("only include Vegetarian meals"),
                onChanged: (bool value) {
                  setState(() {
                    _Vegetarian = value;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
