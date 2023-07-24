import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genderId;
  final String overview;
  final String voteAverage;
  final String releaseDate;

  const Movie(
      {required this.id,
      required this.title,
      required this.backdropPath,
      required this.genderId,
      required this.overview,
      required this.voteAverage,
      required this.releaseDate});
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      genderId: List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      voteAverage: json['vote_average'].toString(),
      releaseDate: json['release_date']);
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'backdrop_path': backdropPath,
        'genre_ids': genderId,
        'overview': overview,
        'vote_average': voteAverage,
        'release_date': releaseDate
      };

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, backdropPath, genderId, overview, voteAverage, releaseDate];
}
