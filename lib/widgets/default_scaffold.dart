import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  final body;
  final title;
  final routeName;

  DefaultScaffold({this.body, this.title, this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: this.body,
      floatingActionButton: addButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }

  FloatingActionButton addButton(BuildContext context) {
    if (routeName != null) {
      return FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(this.routeName),
        tooltip: 'Create a new post.',
        child: const Icon(Icons.camera_alt),
      );
    }
    return null;
  }
}
