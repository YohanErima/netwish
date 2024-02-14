// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:netwish/class/Movie.dart";
import "package:netwish/screen/MovieDetails.dart";

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsMoviePage(movie: movie)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              movie.imageUrl != ""
                  ? Expanded(
                      child: Image.network(
                        movie.imageUrl,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Expanded(
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.black,
                              child: Center(
                                child: Icon(
                                  Icons.help_outline,
                                  size: 100,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Container(
                      width: 100,
                      height: 100,
                      color: Colors.black,
                      child: Center(
                        child: Icon(
                          Icons.help_outline,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                    ),
              Text(movie.title)
            ],
          ),
        ),
      ),
    );
  }
}
