import 'dart:convert';

import 'package:http/http.dart';



class MovieRep{

static Future<List<MovieModel>> getdata({required String api})async{
    Response response=await get(Uri.parse((api)));
    
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => MovieModel.fromJson(e))).toList();
    }
    else{
      return [MovieModel(id: 0, title:response.reasonPhrase.toString() , year: 0, coverurl: 'error')];
    }
  }
}





class MovieModel{
  final int id;
  final String title;
  final int year;
  final String coverurl;

  MovieModel({
    required this.id,
    required this.title,
    required this.year,
    required this.coverurl
      });
  
  factory MovieModel.fromJson(Map<String,dynamic> json){

    return MovieModel(
      id: json['Id'],
      title: json['title'], 
      year: json['year'], 
      coverurl: json['coverurl']);
  }

}