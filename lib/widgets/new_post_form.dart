import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import '../models/post.dart';
import '../widgets/format_image.dart';

class NewPostForm extends StatefulWidget {
  @override
  _NewPostFormState createState() => _NewPostFormState();
}

class _NewPostFormState extends State<NewPostForm> {
  String url;
  final post = FoodWastePost();
  final formKey = GlobalKey<FormState>();
  LocationData locationData;
  var locationService = Location();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getImage(),
      builder: (context, snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            FormatImage(url: url),
            buildForm(context),
            Expanded(
              child:buildButton(context),
            )
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[].where((child) => child != null).toList(); 
          Future.microtask(() => Navigator.pop(context));
        } else {
          children = [
            SizedBox(height: MediaQuery.of(context).size.height/2.5),
            CircularProgressIndicator()];
        }
        return Center(child: Column(children: children));
      }
    );
  }

  Widget buildForm(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 30, 10, 150),
      child: Form(
        key: formKey,
        child: buildInput(context)
      )
    );
  }

  Widget buildInput(context) {
    return Semantics(
      child: TextFormField(
        decoration: const InputDecoration(hintText: 'How many leftovers today?'),
        // From: https://stackoverflow.com/questions/49577781/how-to-create-number-input-field-in-flutter
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
        onSaved: (value) async {
          post.imgURL = url;
          post.leftovers = int.parse(value);
          locationData = await retrieveLocation();
          post.lat = locationData.latitude;
          post.long = locationData.longitude;
          post.date = DateTime.now();
          FirebaseFirestore.instance.collection('posts').add(post.toMap());
        },
        validator: (value) {
          return (value.isEmpty) ? 'Please enter a number.' : null;
        }
      ),
      readOnly: false,
      focusable: true,
      hint: 'Input a number.'
    );
  }

  Widget buildButton(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Semantics(
        child: ElevatedButton(child:
          Icon(Icons.cloud, size: 100),
          onPressed:() {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              Navigator.of(context).pop();
            }
          }
        ),
        button: true,
        enabled: true,
        onTapHint: 'Upload a new post.'
      )
    );
  }

  Future<File> getImage() async {
    final _picker = ImagePicker();
    PickedFile _image = await _picker.getImage(source: ImageSource.camera);

    Reference storageReference = FirebaseStorage.instance.ref().child(DateTime.now().toString());
    await storageReference.putFile(File(_image.path));
    url = await storageReference.getDownloadURL();
    return File(_image.path);
  }

  // Adapted from provided share_location_screen.dart in Exploration: Platform Hardware Services
  Future<LocationData> retrieveLocation() async {
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
          print('Failed to enable service. Returning.');
          return null;
        }
      }
      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          print('Location service permission not granted. Returning.');
        }
      }
      locationData = await locationService.getLocation();
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
      locationData = null;
    }
    locationData = await locationService.getLocation();
    return locationData;
  }
}
