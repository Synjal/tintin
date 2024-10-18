import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/providers/reading_list_provider.dart';
import 'package:tintin/screens/albums_master.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ReadingListProvider()..loadFavorites())
      ],
      child: const AlbumsMaster(),
    )
  );
}
