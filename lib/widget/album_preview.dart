import 'package:flutter/material.dart';

import '../models/album.dart';
import '../screens/album_details.dart';

class AlbumPreview extends StatefulWidget {
  const AlbumPreview({super.key, required this.album});

  final Album? album;

  @override
  State<AlbumPreview> createState() => _AlbumPreviewState();
}

class _AlbumPreviewState extends State<AlbumPreview> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(image: AssetImage(widget.album!.image)),
      title: Text(widget.album!.title),
      trailing: const Icon(Icons.zoom_in),
      tileColor: Colors.white38,
      contentPadding: const EdgeInsets.all(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumDetails(album: widget.album)
          ));
      }
    );
  }
}
