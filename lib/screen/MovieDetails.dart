// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:netwish/class/Movie.dart';

class DetailsMoviePage extends StatelessWidget {
  final Movie movie;

  const DetailsMoviePage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                movie.title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.network(
                    movie.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  movie.overview,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Date : ${movie.releaseDate}",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Note Moyenne : ${movie.voteAverage}",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
