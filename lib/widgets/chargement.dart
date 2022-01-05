
import 'package:api_movies/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Chargement extends StatelessWidget {
  const Chargement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText("Chargement en cours ...", fontStyle: FontStyle.italic,fontSize: 30.0,),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
