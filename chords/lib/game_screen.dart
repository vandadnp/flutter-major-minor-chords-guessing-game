import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🎸',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Text('🔊', style: TextStyle(fontSize: 100.0)),
              Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MajorMinorButton(
                    buttonTitle: 'MINOR',
                    onPressed: () {
                      print('Minor');
                    },
                  ),
                  MajorMinorButton(
                    buttonTitle: 'MAJOR',
                    onPressed: () {
                      print('Major');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MajorMinorButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;

  const MajorMinorButton(
      {@required this.buttonTitle, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: RaisedButton(
        padding: EdgeInsets.all(20),
        onPressed: onPressed,
        child: Text(
          buttonTitle,
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(style: BorderStyle.solid),
        ),
      ),
    );
  }
}
