// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NetWish",
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          elevation: 4,
          leading: IconButton(
            icon: Icon(Icons.tv),
            onPressed: () {},
          ),
          title: Text(
            "NetWish",
            style: TextStyle(color: Colors.red),
          ),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
