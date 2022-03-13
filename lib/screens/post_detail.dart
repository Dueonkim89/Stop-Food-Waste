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
  Widget showPostDetail() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        getPostDate(),
        showImage(),
        showQuantity(),
        showUserCoordinates()
      ],
    ));
  }

  // get date post was created
  Widget getPostDate() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(35, 30, 35, 40),
        child: Text(widget.date,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600)));
  }

  // get image of wasted food
  Widget showImage() {
    return Image.network(
      widget.url,
      height: 275,
    );
  }

  // show quantity of wasted food
  Widget showQuantity() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(35, 50, 35, 40),
        child: Text("${widget.quantity.toString()} items",
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600)));
  }

  // show user location
  Widget showUserCoordinates() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(35, 30, 35, 40),
        child: Text(
            "Location: (${widget.lat.toString()},  ${widget.long.toString()})",
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600)));
  }

  @override
  Widget build(BuildContext context) {
    return ProjectScaffold(
        title: 'Wasteagram',
        childComponent: showPostDetail(),
        showCamera: false);
  }
}
