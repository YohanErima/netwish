// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netwish/class/Movie.dart';
import 'package:netwish/screen/HomeScreen.dart';
import 'package:netwish/screen/MovieDetails.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NetWish",
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
