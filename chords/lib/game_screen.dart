import 'dart:async';
import 'dart:math';
import 'package:chords/chord.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameTimer _timer;
  Random _rnd = Random();

  Chord _currentChord;

  @override
  void initState() {
    super.initState();
    _timer = GameTimer(
      max: 5,
      expired: () {
        print('expired');
      },
      started: () {
        print('started');
        playRandomChord();
      },
      ticker: (value) {
        print('ticker $value');
      },
    );

    _timer.start();
  }

  @override
  void dispose() {
    Chord.disposePlayer();
    super.dispose();
  }

  void playRandomChord() {
    int chordIndex = _rnd.nextInt(chords.length);
    _currentChord = chords[chordIndex];
    _currentChord.play();
  }

  void processAnswer({@required ChordType chordType}) {
    _timer.cancel();
    if (chordType == _currentChord.chordType) {
      // right answer
      setState() {
        _text = '✅';
      }
    } else {
      setState(() {
        _text = '❌';
      });
    }
  }
  
  String _text = '🔊';

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
              Text(
                _text,
                style: TextStyle(fontSize: 100.0),
              ),
              Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MajorMinorButton(
                    buttonTitle: 'MINOR',
                    onPressed: () {
                      processAnswer(chordType: ChordType.Minor);
                    },
                  ),
                  MajorMinorButton(
                    buttonTitle: 'MAJOR',
                    onPressed: () {
                      processAnswer(chordType: ChordType.Major);
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

typedef Ticker = void Function(int);

class GameTimer {
  final VoidCallback started;
  final VoidCallback expired;
  final Ticker ticker;
  final int max;

  Timer _timer;
  int _counter = 0;

  GameTimer({this.started, this.expired, this.ticker, this.max});

  void start() {
    cancel();
    started();
    ticker(_counter);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _counter += 1;
      if (_counter >= max) {
        expired();
        _counter = 0;
        started();
      } else {
        ticker(_counter);
      }
    });
  }

  void cancel() {
    if (_timer != null) {
      _counter = 0;
      _timer.cancel();
    }
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
