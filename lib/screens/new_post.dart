import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
// models
import '../models/NewPostModel.dart';
// widgets
import '../widgets/scaffold.dart';

class NewPost extends StatefulWidget {
  late File image;
  NewPost({Key? key, required this.image}) : super(key: key);

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final formKey = GlobalKey<FormState>();
  LocationData? locationData;
  // Data Transfer Object
  final NewPostDetails = PostDetails();

  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  void getUserLocation() async {
    var locationService = Location();
    locationData = await locationService.getLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ProjectScaffold(
        title: 'New Post', childComponent: showEntryForm(), showCamera: false);
  }

  Widget showEntryForm() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        createFormField(),
      ],
    ));
  }

  Widget createFormField() {
    return Form(
        key: formKey,
        child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.file(widget.image, height: 300),
          Padding(
            padding: EdgeInsets.all(35),
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "Number of Wasted Items",
                  border: OutlineInputBorder()),
              onSaved: (value) {
                // transfer into DTO and save if valid
                NewPostDetails.quantity = int.parse(value!);
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a quantity!";
                }
                try {
                  int rating = int.parse(value);
                } on FormatException {
                  return "Please enter a valid number!";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: ElevatedButton(
              onPressed: () => {
                if (formKey.currentState!.validate())
                  {
                    formKey.currentState!.save(),
                    // store time, long and lat into DTO
                    NewPostDetails.dateTime = DateTime.now(),
                    NewPostDetails.lat = locationData!.latitude,
                    NewPostDetails.long = locationData!.longitude,
                    // send to fire base

                    // get image url and store into DTO

                    // navigate to home page
                    Navigator.of(context).pop()
                  }
              },
              child: const Icon(Icons.cloud_upload_sharp, size: 50),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
            ),
          ),
        ])));
  }
}
