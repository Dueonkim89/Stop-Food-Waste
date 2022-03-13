import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData &&
                    snapshot.data!.docs != null &&
                    snapshot.data!.docs.isNotEmpty) {
                  return Column(
                    children: [
                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            var post = snapshot.data!.docs[index];
                            return ListTile(
                                leading: Text(post['date'],
                                    style: const TextStyle(fontSize: 18)),
                                trailing: Text(post['quantity'].toString(),
                                    style: const TextStyle(fontSize: 18)));
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(children: const [
                    SizedBox(height: 100),
                    SizedBox(
                        child: CircularProgressIndicator(),
                        height: 125.0,
                        width: 125.0),
                  ]);
                }
              })
        ],
      ),
    );
  }
}
