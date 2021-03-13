import 'package:flutter/material.dart';
import '../models/post.dart';
import '../widgets/default_scaffold.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = 'DetailScreen';

  @override
  _PostScreenState createState() => _PostScreenState();  
}

class _PostScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final FoodWastePost data = ModalRoute.of(context).settings.arguments;
    return DefaultScaffold(
      title: '${data.date}',
      body: Text('Post Screen')
    );
  }
}