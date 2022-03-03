import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// widgets
import '../widgets/scaffold.dart';
import './new_post.dart';

class CameraPage extends StatefulWidget {
  CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late File image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ProjectScaffold(
        title: 'Photos',
        childComponent: showCameraPictures(context),
        showCamera: false);
  }

  Widget showCameraPictures(BuildContext context) {
    // button to either allow taking a picture or uploading from gallery
    // redirect to new_post once image is taken or selected..
    return Center(
        child: ElevatedButton(
      child: Text('Take photo'),
      onPressed: () {
        takePicture(context);
      },
    ));
  }

  // take picture
  void takePicture(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    image = File(pickedFile!.path);
    // route to new_post
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => NewPost(
              image: image,
            )));
  }
}
