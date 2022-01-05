import 'package:api_movies/models/api_movie.dart';
import 'package:api_movies/models/movie.dart';
import 'package:api_movies/widgets/chargement.dart';
import 'package:api_movies/widgets/custom_text.dart';
import 'package:api_movies/widgets/error_page.dart';
import 'package:api_movies/widgets/movie_list.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {

  @override
  void initState() {
    getPopularMovie();
    super.initState();
  }

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
      body: FutureBuilder<List<Movie>>(
        future: getPopularMovie(),
        builder: (context, snapshot){
          print(snapshot.connectionState.toString());
          switch(snapshot.connectionState){
            case ConnectionState.waiting: return Chargement();
            default:
              if(snapshot.hasError){
                return ErrorPage();
              }else{
                if(snapshot.data == null){
                  return Center(child: CustomText("no Movies"),);
                }
                return MovieList(movies: snapshot.data!);
              }
          }
        },
      ),
    );
  }




  Future<List<Movie>> getPopularMovie() async{
    List<Movie> movies = [];
    ApiMovie api = ApiMovie();
    Map<String,dynamic> map =  await api.getPopular();
    await Future.delayed(Duration(seconds: 3));
    if(map["code"] == 200){
      movies = Movie.moviesFromApi(map["body"]);
      movies.shuffle();
    }
    return movies;
  }
}

