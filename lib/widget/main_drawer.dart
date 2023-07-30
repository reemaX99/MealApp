import 'package:flutter/material.dart';
import '../screens/filiters_Screen.dart';
import '../screens/tabs_Screen.dart';
import '../screens/Category_Meal_Screen.dart';

class MainDrawer extends StatelessWidget {
  Widget BuildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Colors.amber,
              child: Text(
                'Cooking up!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                ),
              )),
          SizedBox(height: 20),
          //  BuildListTile("Meal", Icons.restaurant),
          // BuildListTile("Filters", Icons.settings, () { Navigator.of(context).pushNamed(FilterScreen.routename); }),
          ListTile(
            leading: Icon(Icons.restaurant, size: 26),
            title: Text(
              'Meals',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),

          ListTile(
            leading: Icon(Icons.settings, size: 26),
            title: Text(
              'Filters',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routename);
            },
          ),
        ],
      ),
    );
  }
}
