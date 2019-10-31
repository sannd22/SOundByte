import 'package:flutter/material.dart';
import 'package:sound_byte/homePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sound Byte',
      body: StreamBuilder(
        stream: Firestore.instance.collection('Messages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hadData) return const Text('Loading...');
          return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) =>
              _buildListItem(context, snapshot.data.documents[index]),
          );
        }
      )
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }

  bool testFunction() {
    return true;
  }
}
