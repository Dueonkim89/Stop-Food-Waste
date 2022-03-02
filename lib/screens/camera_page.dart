import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/scaffold.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  //late File image;

  @override
  Widget build(BuildContext context) {
    return ProjectScaffold(
        title: 'Photos',
        childComponent: showCameraPictures(),
        showCamera: false);
  }

  Widget showCameraPictures() {
    // button to either allow taking a picture or uploading from gallery
    // redirect to new_post once image is taken or selected..
    return Text("To display button");
  }
}
