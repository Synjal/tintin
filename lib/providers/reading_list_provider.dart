import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/album.dart';

class ReadingListProvider with ChangeNotifier {
  List<Album> _readingList = [];

  List<Album> get readingList => _readingList;

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList('favorites');
    if (favorites != null) {
      _readingList = favorites.map((item) {
        return Album.fromJSON(jsonDecode(item));
      }).toList();
      debugPrint('Favorites loaded: $_readingList');
      notifyListeners();
    }
  }

  void saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = _readingList.map((album) => jsonEncode(album.toJSON())).toList();
    prefs.setStringList('favorites', favorites);
    notifyListeners();
  }

  void cleanFavorites() {
    _readingList.clear();
    saveFavorites();
    notifyListeners();
  }

  void addAlbum(Album album) {
    _readingList.add(album);
    saveFavorites();
    notifyListeners();
  }

  void removeAlbum(Album album) {
    _readingList.remove(album);
    saveFavorites();
    notifyListeners();
  }

  Album getAlbumByNumber(int number) {
    return _readingList.firstWhere((a) => a.number == number);
  }
}
