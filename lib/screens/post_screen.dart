import 'package:flutter/material.dart';
import '../widgets/default_scaffold.dart';

class PostScreen extends StatefulWidget {
  static const routeName = 'PostScreen';

  @override
  _PostScreenState createState() => _PostScreenState();  
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Post Details',
      body: Text('Post Screen')
    );
  }
}