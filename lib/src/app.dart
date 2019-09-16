import 'package:flutter/material.dart';
import 'screens/imagelist.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    // wrap our application with the Images Provider
    return MaterialApp(
      title: 'View Images',
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('View Images'),
        ),
        body: ImageList(),
      ),
    );
  }
}
