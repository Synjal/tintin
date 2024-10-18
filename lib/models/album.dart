import 'package:tintin/models/gps.dart';

class Album {
  String title = "";
  int number = 0;
  int year = 0;
  int? yearInColor = 0;
  String image = "";
  String resume = "";
  GPS gps = GPS(0, 0);
  String location = "";

  Album({
    required this.title,
    required this.number,
    required this.year,
    this.yearInColor,
    required this.image,
    required this.resume,
    required this.gps,
    required this.location});

  @override
  String toString() {
    return "Title: $title, Number: $number, Year: $year, YearInColor: $yearInColor, Image: $image, Resume: $resume, GPS: $gps, Location: $location";
  }

  String toJSON() {
    return "{ title: '$title', number: $number, year: $year, yearInColor: $yearInColor, image: '$image', resume: '$resume', gps: $gps.toJSON(), location: '$location'  }";
  }

  factory Album.fromJSON(Map<String, dynamic> json) {
    return Album(
      title: json['title'] as String,
      number: json['number'] as int,
      year: json['year'] as int,
      yearInColor: json['yearInColor'] as int?,
      image: 'img/' + json['image'],
      resume: json['resume'] as String,
      gps: GPS.fromJSON(json['gps']),
      location: json['location'] as String,
    );
  }
}
