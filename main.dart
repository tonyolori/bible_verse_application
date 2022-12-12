// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'bible_page.dart'; 
import 'constants.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: kdarkTheme,
      home: const RandBible(),
    );
  }
}

class RandBible extends StatefulWidget {
  const RandBible({Key? key}) : super(key: key);

  @override
  State<RandBible> createState() => _RandBibleState();
}

class _RandBibleState extends State<RandBible> {

  @override
  Widget build(BuildContext context) {
    return Menu();
  }
}
