// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:netwish/class/Constante.dart';
import 'package:netwish/class/Movie.dart';
import 'package:netwish/widgets/MovieCard.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import "package:http/http.dart" as http;
import "dart:convert";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<Movie> _movies = [];

  Future<void> searchMovies() async {
    String searchTerm = searchController.text;

    String apiUrl =
        'https://api.themoviedb.org/3/search/movie?api_key=${Constante.apiKey}&query=$searchTerm&language=fr-FR';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var searchData = jsonDecode(response.body);
      List<Movie> movies = [];

      for (var movieData in searchData['results']) {
        movies.add(Movie(
          title: movieData['title'],
          imageUrl: movieData['poster_path'] != null
              ? 'https://image.tmdb.org/t/p/w500${movieData['poster_path']}'
              : "",
        ));
      }

      setState(() {
        _movies = movies;
      });
    } else {
      // Afficher une alerte en cas d'erreur de requête
      Alert(
        context: context,
        title: 'Erreur',
        desc: 'Une erreur s\'est produite lors de la recherche.',
        buttons: [
          DialogButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ).show();
    }
  }

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
                        controller: searchController,
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
                        searchMovies();
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
        body: GridView.builder(
            itemCount: _movies.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0),
            itemBuilder: (context, index) {
              return MovieCard(movie: _movies[index]);
            }));
  }
}
