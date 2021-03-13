import 'package:flutter/material.dart';
import 'screens/list_screen.dart';
import 'screens/new_screen.dart';
import 'screens/detail_screen.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  static final routes = {
    ListScreen.routeName: (context) => ListScreen(),
    DetailScreen.routeName: (context) => DetailScreen(),
    NewScreen.routeName: (context) => NewScreen()
  };
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      initialRoute: ListScreen.routeName,
      routes: routes
    );
  }
}
