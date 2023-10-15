import 'dart:convert';

import 'package:http/http.dart';

class MovieInfoModel {
  Movie? movie;
  List<String>? genres;
  List<String>? languages;
  List<Files>? files;

  MovieInfoModel({this.movie, this.genres, this.languages, this.files});

  MovieInfoModel.fromJson(Map<String, dynamic> json) {
    movie = json['movie'] != null ?  Movie.fromJson(json['movie']) : null;
    genres = json['genres'].cast<String>();
    languages = json['languages'].cast<String>();
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(new Files.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movie != null) {
      data['movie'] = this.movie!.toJson();
    }
    data['genres'] = this.genres;
    data['languages'] = this.languages;
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie {
  int? id;
  String? title;
  int? year;
  String? plot;
  String? airdate;
  String? runtimes;
  String? coverurl;
  String? fullcoverurl;

  Movie(
      {this.id,
      this.title,
      this.year,
      this.plot,
      this.airdate,
      this.runtimes,
      this.coverurl,
      this.fullcoverurl});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['title'];
    year = json['year'];
    plot = json['plot'];
    airdate = json['airdate'];
    runtimes = json['runtimes'];
    coverurl = json['coverurl'];
    fullcoverurl = json['fullcoverurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['title'] = this.title;
    data['year'] = this.year;
    data['plot'] = this.plot;
    data['airdate'] = this.airdate;
    data['runtimes'] = this.runtimes;
    data['coverurl'] = this.coverurl;
    data['fullcoverurl'] = this.fullcoverurl;
    return data;
  }
}

class Files {
  int? id;
  int? fileId;
  String? fileName;
  String? size;
  int? height;
  int? width;
  String? audiolan;

  Files(
      {this.id,
      this.fileId,
      this.fileName,
      this.size,
      this.height,
      this.width,
      this.audiolan});

  Files.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    fileId = json['file_id'];
    fileName = json['file_name'];
    size = json['size'];
    height = json['height'];
    width = json['width'];
    audiolan = json['audiolan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['file_id'] = this.fileId;
    data['file_name'] = this.fileName;
    data['size'] = this.size;
    data['height'] = this.height;
    data['width'] = this.width;
    data['audiolan'] = this.audiolan;
    return data;
  }
}



class MovieInfoRep{

  static Future<MovieInfoModel> getmovieinfo({required String api})async{
    Response response=await get(Uri.parse((api)));
    
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return MovieInfoModel.fromJson(result);
    }
    else{
      return MovieInfoModel(movie:null);
    }
  }

}
