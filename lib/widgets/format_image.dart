import 'package:flutter/material.dart';

class FormatImage extends StatelessWidget {
  final image;
  final url;
  FormatImage({this.image, this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2.5,
      width: MediaQuery.of(context).size.width,
      child: imageDecider()
    );
  }

  Widget imageDecider() {
    return (image != null) ?
      Image.file(image, fit: BoxFit.cover) : Image.network(url, fit: BoxFit.cover);
  }
}
