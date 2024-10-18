import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/providers/reading_list_provider.dart';
import 'package:tintin/screens/albums_master.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ReadingListProvider(),
      child: const AlbumsMaster()
    )
  );
}
