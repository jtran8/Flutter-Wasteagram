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
    final String leftovers = '${data.leftovers} Wasted Items';
    final String location = 'Location: ${data.lat}, ${data.long}';
    
    return Center(
      child: Column(
        children: [
          Image.network(data.imgURL),
          buildText(3, leftovers, Theme.of(context).textTheme.headline4),
          buildText(1, location, Theme.of(context).textTheme.subtitle1)
        ]
      )
    );
  }

  Widget buildText(flex, text, style) {
    return Flexible(
      fit: FlexFit.tight,
      flex: flex,
      child: Align(
        alignment: Alignment.center, 
        child: Text('$text', style: style)
      )
    );
  }
}
