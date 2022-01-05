import 'package:api_movies/models/movie.dart';
import 'package:api_movies/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {
  Movie movie;
  PageDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(movie.title),
      ),
      body: SingleChildScrollView(
        child: CustomText(movie.overview),
      ),
    );
  }
}
