import 'package:flutter/material.dart';

void main() {
  var colorScheme = ColorScheme.fromSeed(seedColor: Colors.red);
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: colorScheme.inversePrimary,
    appBar: AppBar(
      title: const Text('Text'),
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    ),
    body: const Center(
      child: Image(
        image: NetworkImage("https://placehold.co/600x400/png"),
      ),
    ),
  )));
}
