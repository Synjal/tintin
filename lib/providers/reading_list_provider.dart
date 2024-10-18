import 'package:flutter/cupertino.dart';

import '../models/album.dart';

class ReadingListProvider with ChangeNotifier {
  final List<Album> _readingList = [];

  List<Album> get readingList => _readingList;

  void addAlbum(Album album) {
    _readingList.add(album);
    notifyListeners();
  }

  void removeAlbum(Album album) {
    _readingList.remove(album);
    notifyListeners();
  }
}
