import 'package:flutter/material.dart';
import 'package:chords/screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chords'),
      ),
      body: Center(
          child: RaisedButton(
        child: Text(
          'READY?',
          style: TextStyle(fontSize: 30.0),
        ),
        elevation: 5.0,
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        onPressed: () => {
          Navigator.pushNamed(context, Screen.Game.id)
        },
      )),
    );
  }
}
