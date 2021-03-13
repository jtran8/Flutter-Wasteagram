import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'detail_screen.dart';
import 'new_screen.dart';
import '../models/post.dart';
import '../widgets/default_scaffold.dart';

class ListScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _ListScreenState createState() => _ListScreenState();  
}

class _ListScreenState extends State<ListScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Wasteagram',
      routeName: NewScreen.routeName,
      body: buildDecider(context)
    );
  }

  Widget buildDecider(context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').orderBy('date', descending: true).snapshots(),
      builder: (content, snapshot) {
        if (snapshot.hasData && snapshot.data.docs != null && snapshot.data.docs.length > 0) {
          return buildList(context, snapshot);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  Widget buildList(context, snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.docs.length,
      itemBuilder: (context, index) {
        var post = snapshot.data.docs[index];
        return buildTile(context, post);
      }
    );
  }

  Widget buildTile(context, post) {
    final format = DateFormat('EEEE, MMMM d, y');
    DateTime date = post['date'].toDate();
    var currPost = FoodWastePost(
      imgURL: post['imgURL'],
      leftovers: post['leftovers'],
      lat: post['lat'],
      long: post['long'],
      date: format.format(date)
    );
    return ListTile(
      title: Text(format.format(date)),
      trailing: Text(
        post['leftovers'].toString(),
        style: Theme.of(context).textTheme.headline6,
      ),
      onTap: () => Navigator.of(context).pushNamed(
          DetailScreen.routeName,
          arguments: currPost
      )
    );
  }
}
