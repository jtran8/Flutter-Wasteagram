import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  final body;
  final title;
  final routeName;

  DefaultScaffold({this.body, this.title, this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: this.body,
      floatingActionButton: Semantics(
        child: addButton(context),
        label: 'A button to start creating a new Wastegram post by capturing a photo.',
        button: true,
        enabled: true,
        onTapHint: 'Take a photo for a new post.'
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }

  FloatingActionButton addButton(BuildContext context) {
    if (routeName != null) {
      return FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(this.routeName),
        child: const Icon(Icons.camera_alt)
      );
    }
    return null;
  }
}
