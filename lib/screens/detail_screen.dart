// DetailScreen: builds the detail screen for a single post.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/post.dart';
import '../widgets/default_scaffold.dart';
import '../widgets/format_image.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = 'DetailScreen';

  @override
  _PostScreenState createState() => _PostScreenState();  
}

class _PostScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final FoodWastePost data = ModalRoute.of(context).settings.arguments;
    final date = DateFormat('EEEE, MMMM d, y').format(data.date);
    return DefaultScaffold(
      title: '$date',
      body: buildDetails(context, data)
    );
  }

  Widget buildDetails(context, data) {
    final String leftovers = '${data.leftovers} Wasted Items';
    final String location = 'Location: ${data.lat}, ${data.long}';
    
    return Center(
      child: Column(
        children: [
          FormatImage(url: data.imgURL),
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
