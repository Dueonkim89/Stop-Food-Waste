import 'package:flutter/material.dart';
// screens
import '../screens/camera_page.dart';

class ProjectScaffold extends StatefulWidget {
  final String title;
  final Widget childComponent;
  final bool showCamera;

  ProjectScaffold(
      {Key? key,
      required this.title,
      required this.childComponent,
      required this.showCamera})
      : super(key: key);

  @override
  _ProjectScaffoldState createState() => _ProjectScaffoldState();
}

class _ProjectScaffoldState extends State<ProjectScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: widget.childComponent,
      // only show if from main page
      floatingActionButton:
          widget.showCamera ? showCameraActionButton(context) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // method to show camera action button
  Widget showCameraActionButton(BuildContext context) {
    return Semantics(
        enabled: true,
        button: true,
        label: 'Button to navigate to camera screen',
        onTapHint: 'Navigate to camera screen',
        child: FloatingActionButton(
          // route to camera page
          onPressed: () => routeToCameraPage(context),
          tooltip: 'Take picture of wasted food',
          child: const Icon(Icons.camera_alt_sharp),
        ));
  }

  // route to camera page
  void routeToCameraPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CameraPage()));
  }
}
