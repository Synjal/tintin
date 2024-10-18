import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/album.dart';

class AlbumService {
  static Future<List<Album>> fetchAlbums() async {
    final String json = await rootBundle.loadString('data/albums.json');
    final data = jsonDecode(json);
    return data.map<Album>((album) => Album.fromJSON(album)).toList();
  }
}
