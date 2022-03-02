import 'package:flutter/material.dart';
import '../widgets/scaffold.dart';

class CameraPage extends StatefulWidget {
  CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return ProjectScaffold(
        title: 'Photos',
        childComponent: showCameraPictures(),
        showCamera: false);
  }

  Widget showCameraPictures() {
    return Text("This is the camera page!");
  }
}
