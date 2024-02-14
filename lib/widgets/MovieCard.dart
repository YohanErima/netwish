import 'package:flutter/material.dart';
import 'package:netwish/class/Movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          movie.imageUrl != ""
              ? Expanded(
                  child: Image.network(
                    width: 50,
                    movie.imageUrl,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      // Afficher un carré noir si l'image n'est pas disponible
                      return Expanded(
                        child: Container(
                          color: Colors.black,
                          width: 50, // Ajustez la largeur selon vos besoins
                          height: 50, // Ajustez la hauteur selon vos besoins
                        ),
                      );
                    },
                  ),
                )
              : Container(
                  color: Colors.black,
                  width: 50, // Ajustez la largeur selon vos besoins
                  height: 50, // Ajustez la hauteur selon vos besoins
                ),
          Text(movie.title)
        ],
      ),
    );
  }
}
