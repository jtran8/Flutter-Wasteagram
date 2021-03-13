import 'package:flutter/material.dart';
import '../widgets/default_scaffold.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = 'DetailScreen';

  @override
  _PostScreenState createState() => _PostScreenState();  
}

class _PostScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Post Details',
      body: Text('Post Screen')
    );
  }
}