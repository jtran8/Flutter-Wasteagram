// MyApp: builds the root MaterialApp widget

import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'screens/list_screen.dart';
import 'screens/new_screen.dart';
import 'screens/detail_screen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  static final routes = {
    ListScreen.routeName: (context) => ListScreen(analytics: analytics, observer: observer),
    DetailScreen.routeName: (context) => DetailScreen(),
    NewScreen.routeName: (context) => NewScreen()
  };
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: <NavigatorObserver>[observer],
      title: 'Wasteagram',
      initialRoute: ListScreen.routeName,
      routes: routes
    );
  }
}
