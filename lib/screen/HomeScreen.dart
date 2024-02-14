// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          IconButton(
            onPressed: () {
              Alert(
                context: context,
                title: 'Recherche',
                style: AlertStyle(titleStyle: TextStyle(color: Colors.red)),
                content: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Film à chercher',
                      ),
                    ),
                  ],
                ),
                buttons: [
                  DialogButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Recherche',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ).show();
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
