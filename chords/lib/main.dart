import 'package:flutter/material.dart';
import 'package:chords/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      routes: {
        Screen.Welcome.id: (context) => Screen.Welcome.instance,
        Screen.Game.id: (context) => Screen.Game.instance,
      },
      initialRoute: Screen.Welcome.id,
    );
  }
}
