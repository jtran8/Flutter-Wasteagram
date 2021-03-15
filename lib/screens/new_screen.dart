// NewScreen: builds the new post screen.

import 'package:flutter/material.dart';
import '../widgets/default_scaffold.dart';
import '../widgets/new_post_form.dart';

class NewScreen extends StatefulWidget {
  static const routeName = 'NewScreen';

  @override
  _NewScreenState createState() => _NewScreenState();  
}

class _NewScreenState extends State<NewScreen> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'New Post',
      body: NewPostForm()
    );
  }
}
