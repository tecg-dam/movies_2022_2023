import 'package:flutter/material.dart';
import 'package:movies/styles/constants.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text("Nous avons un problème de connexion", style: kTitle1Style,))),
    );
  }
}
