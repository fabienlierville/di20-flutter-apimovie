class Movie{
  final int id;
  final String title;
  final String overview;
  final DateTime releaseDate;
  final String imageUrl;
  final double vote;

  Movie({required this.id,required  this.title,required  this.overview,required  this.releaseDate,required  this.imageUrl, required this.vote});


  static List<Movie> moviesFromApi(Map<String,dynamic> jsonBody){
    List<Movie> l = [];
    List<dynamic> results = jsonBody["results"];
    results.forEach((data) {
      Movie movie = Movie(
        id: data["id"],
        title: data["title"],
        overview: data["overview"],
        imageUrl: data["poster_path"],
        releaseDate: DateTime.parse(data["release_date"]),
        vote: double.tryParse( data["vote_average"].toString()) ?? 0
      );
      l.add(movie);
    });
    return l;
  }

}