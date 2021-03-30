import 'package:flutter/material.dart';
import 'package:rive_animations/search/search.dart';

void main() {
  runApp(RiveAnimations());
}

class RiveAnimations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Search(),
      },
    );
  }
}