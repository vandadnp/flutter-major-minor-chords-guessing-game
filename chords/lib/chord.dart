import 'package:assets_audio_player/assets_audio_player.dart';

enum ChordType { Major, Minor }

var _player = AssetsAudioPlayer.newPlayer();

class Chord {
  
  static void disposePlayer() {
    _player.stop();
  }
  
  final String fileName;
  final String name;
  final ChordType chordType;
  const Chord({this.fileName, this.name, this.chordType});

  static String dir = "assets/audios";

  String path() => "$dir/$fileName";

  void play() {
    _player.stop();
    _player.open(
      Audio(path()),
      autoStart: true,
      showNotification: false,
    );
  }
}

const chords = [
  Chord(
    fileName: "A-major.wav",
    name: "A Major",
    chordType: ChordType.Major,
  ),
  Chord(
    fileName: "A-minor.wav",
    name: "A Minor",
    chordType: ChordType.Minor,
  ),
  Chord(
    fileName: "Ab-major.wav",
    name: "Ab Major",
    chordType: ChordType.Major,
  ),
  Chord(
    fileName: "Ab-minor.wav",
    name: "Ab Minor",
    chordType: ChordType.Minor,
  ),
  Chord(
    fileName: "B-major.wav",
    name: "B Major",
    chordType: ChordType.Major,
  ),
  Chord(
    fileName: "B-minor.wav",
    name: "B Minor",
    chordType: ChordType.Minor,
  ),
  Chord(
    fileName: "Bb-major.wav",
    name: "Bb Major",
    chordType: ChordType.Major,
  ),
  Chord(
    fileName: "Bb-minor.wav",
    name: "Bb Minor",
    chordType: ChordType.Minor,
  ),
  Chord(
    fileName: "C-major.wav",
    name: "C Major",
    chordType: ChordType.Major,
  ),
  Chord(
    fileName: "C-minor.wav",
    name: "C Minor",
    chordType: ChordType.Minor,
  ),
  Chord(
    fileName: "D-major.wav",
    name: "D Major",
    chordType: ChordType.Major,
  ),
  Chord(
    fileName: "D-minor.wav",
    name: "D Minor",
    chordType: ChordType.Minor,
  ),
  Chord(
    fileName: "Db-major.wav",
    name: "Db Major",
    chordType: ChordType.Major,
  ),
  Chord(
    fileName: "Db-minor.wav",
    name: "Db Minor",
    chordType: ChordType.Minor,
  ),
  Chord(
    fileName: "E-major.wav",
    name: "E Major",
    chordType: ChordType.Major,
  ),
  Chord(
    fileName: "E-minor.wav",
    name: "E Minor",
    chordType: ChordType.Minor,
  ),
  Chord(
    fileName: "Eb-major.wav",
    name: "Eb Major",
    chordType: ChordType.Major,
  ),
  Chord(
    fileName: "Eb-minor.wav",
    name: "Eb Minor",
    chordType: ChordType.Minor,
  ),
  Chord(
    fileName: "F-major.wav",
    name: "F Major",
    chordType: ChordType.Major,
  ),
  Chord(
    fileName: "F-minor.wav",
    name: "F Minor",
    chordType: ChordType.Minor,
  ),
  Chord(
    fileName: "Fsharp-major.wav",
    name: "F# Major",
    chordType: ChordType.Major,
  ),
  Chord(
    fileName: "Fsharp-minor.wav",
    name: "F# Minor",
    chordType: ChordType.Minor,
  ),
  Chord(
    fileName: "G-major.wav",
    name: "G Major",
    chordType: ChordType.Major,
  ),
  Chord(
    fileName: "G-minor.wav",
    name: "G Minor",
    chordType: ChordType.Minor,
  ),
];
