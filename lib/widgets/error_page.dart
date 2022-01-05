import 'package:api_movies/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText("Erreur lors de l'apple API", color: Colors.red,fontSize: 30.0,),
    );
  }
}
