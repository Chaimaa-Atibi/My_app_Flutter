import 'package:flutter/material.dart';
import './quiz.dart';
import './weather.dart';
import './gallery.dart';
import './camera.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
          child: Text(
        'Hello',
        style: TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
      )),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new DrawerHeader(
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/logo.png'),
                ),
              ),
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.blueAccent, Colors.white])),
            ),
            ListTile(
                title: Text(
                  ' Quiz',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Quiz()));
                }),
            ListTile(
                title: Text(
                  'Weather',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Weather()));
                }),
            ListTile(
                title: Text(
                  'Gallery',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Gallery()));
                }),
            ListTile(
                title: Text(
                  'Camera',
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Camera()));
                }),
          ],
        ),
      ),
    );
  }
}
