// ListScreen: builds the list screen of all posts.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'detail_screen.dart';
import 'new_screen.dart';
import '../models/post.dart';
import '../widgets/default_scaffold.dart';

class ListScreen extends StatefulWidget {
  static const routeName = '/';
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  ListScreen({this.analytics, this.observer});

  @override
  _ListScreenState createState() => _ListScreenState();  
}

class _ListScreenState extends State<ListScreen> {
  // Failed attempt at including the total in the appbar
  // var counter = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   loadCounter();
  // }

  // void loadCounter() {
  //   FirebaseFirestore.instance.collection('posts').get()
  //   .then((QuerySnapshot querySnapshot) => {
  //       querySnapshot.docs.forEach((doc) {
  //           counter += doc['leftovers'];
  //       })
  //   });
  //   setState(() {});
  // }

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
        final post = snapshot.data.docs[index];
        return buildTile(context, post);
      }
    );
  }

  Widget buildTile(context, post) {
    final date = post['date'].toDate();
    final currPost = FoodWastePost(
      imgURL: post['imgURL'],
      leftovers: post['leftovers'],
      lat: post['lat'],
      long: post['long'],
      date: date
    );
    return Semantics(
      child: ListTile(
        title: Text(DateFormat('EEEE, MMMM d, y').format(date)),
        trailing: Text(
          post['leftovers'].toString(),
          style: Theme.of(context).textTheme.headline6,
        ),
        onTap: () {
          FirebaseAnalytics().logEvent(name: 'tile_tap', parameters: null);
          Navigator.of(context).pushNamed(
            DetailScreen.routeName,
            arguments: currPost
          );
        } 
      ),
      enabled: true,
      onTapHint: 'Display the details of the post.'
    );
  }
}
