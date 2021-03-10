import 'package:flutter/material.dart';
import 'new_screen.dart';
import '../widgets/default_scaffold.dart';

class ListScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _ListScreenState createState() => _ListScreenState();  
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Wasteagram',
      routeName: NewScreen.routeName,
      body: Text('List Screen')
    );
  }
}