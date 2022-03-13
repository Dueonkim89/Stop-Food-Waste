import 'package:flutter/material.dart';
// widgets
import '../widgets/scaffold.dart';

class PostDetail extends StatefulWidget {
  final double lat;
  final double long;
  final int quantity;
  final String date;
  final String url;

  const PostDetail(
      {Key? key,
      required this.lat,
      required this.long,
      required this.quantity,
      required this.date,
      required this.url})
      : super(key: key);

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    print(
        "${widget.lat}, ${widget.long}, ${widget.quantity}, ${widget.date}, ${widget.url}");
    return ProjectScaffold(
        title: 'Wasteagram', childComponent: Text("HI!"), showCamera: false);
  }
}
