import 'dart:convert';

class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterImageUrl,
  });

  int id;
  String title;
  String overview;
  String posterImageUrl;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterImageUrl,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      posterImageUrl: map['poster_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
