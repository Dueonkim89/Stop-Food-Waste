import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
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
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Image.file(widget.image, height: 250),
      Padding(
          padding: EdgeInsets.all(35),
          child: TextFormField(
            autofocus: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                hintText: "Number of Wasted Items",
                border: OutlineInputBorder()),
          )),
    ]));
  }
}
