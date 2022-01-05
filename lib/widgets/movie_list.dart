import 'package:api_movies/models/movie.dart';
import 'package:api_movies/pages/page_details.dart';
import 'package:api_movies/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  List<Movie> movies;
  MovieList({Key? key, required this.movies}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return ListView.builder(
        itemCount: movies.length, 
        itemBuilder: (context, index){
          Movie movie = movies[index];
          return Container(
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 10,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return PageDetail(movie: movie);
                  }));
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: _size.width / 2.5,
                          child: CustomText(movie.title, color: Colors.blue,),
                        ),
                        CustomText(movie.releaseDate.toString(), color: Colors.red,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          elevation: 8,
                          child: Container(
                            width: _size.width / 2.5,
                            child: Image.network(movie.getImage(), fit:  BoxFit.fitWidth,),
                          ),
                        ),
                        Container(
                          width: _size.width / 2.5,
                          height: _size.height / 4,
                          child: CustomText(movie.overview, overFlow: TextOverflow.clip,),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            )
          );
        }
    );
  }
}
