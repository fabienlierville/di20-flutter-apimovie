import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiMovie{
  final String Url = "https://api.themoviedb.org/3";
  final String Key = "f5a8a486fb069fcb10396a7a3e49ceb4";
  final String Lang = "fr-FR";


  // J'aimerai bien que ça me retourn un truc dans le genre :
  // {code=200,body=json ....}
  Future<Map<String, dynamic>> getPopular() async{
    http.Response response;
    String completeUrl = "${this.Url}/movie/popular?api_key=${this.Key}&language=${this.Lang}&page=1";
    print(completeUrl);

    response = await http.get(Uri.parse(completeUrl));

    Map<String,dynamic> map = {
      "code": 400,
      "body": ""
    };

    if(response.statusCode==200){
      map["code"] = 200;
      map["body"] = jsonDecode(response.body);
    }else{
      map["body"] = "Error etc.";
    }


    return map;

  }

}