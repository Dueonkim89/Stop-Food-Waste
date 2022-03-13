// ignore: avoid_relative_lib_imports
import '../lib/models/NewPostModel.dart';
import 'package:test/test.dart';

void main() {
  test('Test if model data is accurate # 1', () {
    // set up data to be tested
    final date = DateTime.now();
    const url = 'www.google.com';
    const quantity = 5;
    const lat = 3.45678;
    const long = 9.456674;

    // exercise the model
    final PostDetail = PostDetails();
    PostDetail.long = long;
    PostDetail.lat = lat;
    PostDetail.imageURL = url;
    PostDetail.quantity = quantity;
    PostDetail.dateTime = date;

    // verify behavior
    expect(PostDetail.long, long);
    expect(PostDetail.lat, lat);
    expect(PostDetail.quantity, quantity);
    expect(PostDetail.imageURL, url);
    expect(PostDetail.dateTime, date);
  });
}
