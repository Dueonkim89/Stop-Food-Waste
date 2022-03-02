import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: widget.childComponent,
      // only show if from main page
      floatingActionButton: widget.showCamera ? showCameraActionButton() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget showCameraActionButton() {
    return FloatingActionButton(
      onPressed: () => {},
      tooltip: 'Increment',
      child: const Icon(Icons.camera_alt_sharp),
    );
  }
}
