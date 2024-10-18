import 'package:flutter/material.dart';

import '../models/album.dart';

class AlbumDetails extends StatefulWidget {
  const AlbumDetails({super.key, required this.album});

  final Album? album;

  @override
  State<AlbumDetails> createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Album Details'),
          backgroundColor: Colors.orange,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Album n°: ${widget.album!.number}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Text(
                  widget.album!.resume,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 24),
                Text(
                  'Year: ${widget.album!.year}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Numéro : ${widget.album!.number}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 24),
                Image(
                    image: AssetImage(widget.album!.image),
                    height: 200,
                    width: 200),
                const SizedBox(height: 24),
              ]
          ),
        )
      ),
    );
  }
}
