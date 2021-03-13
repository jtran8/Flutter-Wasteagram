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
      body: buildDetails(context, data)
    );
  }

  Widget buildDetails(context, data) {
    return Center(
      child: Column(
        children: [
          Image.network(data.imgURL),
          Text(
              '${data.leftovers} Wasted Items',
              style: Theme.of(context).textTheme.headline4
          ),
          Text(
              'Location: ${data.lat}, ${data.long}',
              style: Theme.of(context).textTheme.subtitle1
          )
       ],
      )
    );
  }
}