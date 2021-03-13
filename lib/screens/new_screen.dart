import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/default_scaffold.dart';

class NewScreen extends StatefulWidget {
  static const routeName = 'NewScreen';

  @override
  _NewScreenState createState() => _NewScreenState();  
}

class _NewScreenState extends State<NewScreen> {
  File image;
  
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'New Post',
      body: Text('New Post Screen')
    );
  }
}