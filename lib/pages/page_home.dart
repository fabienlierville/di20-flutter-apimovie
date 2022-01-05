import 'package:api_movies/models/api_movie.dart';
import 'package:api_movies/models/movie.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  List<Movie> movies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Films"),
        actions: [
          IconButton(
            onPressed: getPopularMovie,
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(),
    );
  }

  Future<void> getPopularMovie() async{
    ApiMovie api = ApiMovie();
    Map<String,dynamic> map =  await api.getPopular();
    if(map["code"] == 200){
      movies = Movie.moviesFromApi(map["body"]);
      movies.shuffle();
      movies.forEach((Movie movie) {
        print(movie.title);
      });
    }else{
      //Todo
    }
  }
}
