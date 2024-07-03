import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  XylophoneApp({super.key});

  Widget XylophoneButton(AudioPlayer player, int note, Color bgColor) {
    return Expanded(
      child: TextButton(
        onPressed: () async {
          await player.play(AssetSource('note$note.wav'));
        },
        child: Container(
          color: bgColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final audioPlayer = AudioPlayer();
    audioPlayer.setPlayerMode(PlayerMode.lowLatency);
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              XylophoneButton(audioPlayer, 1, Colors.red),
              XylophoneButton(audioPlayer, 2, Colors.orange),
              XylophoneButton(audioPlayer, 3, Colors.yellow),
              XylophoneButton(audioPlayer, 4, Colors.green),
              XylophoneButton(audioPlayer, 5, Colors.blue),
              XylophoneButton(audioPlayer, 6, Colors.indigo),
              XylophoneButton(audioPlayer, 7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
