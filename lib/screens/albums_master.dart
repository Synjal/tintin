import 'package:flutter/material.dart';
import 'package:tintin/services/album_service.dart';
import 'package:tintin/widget/album_preview.dart';

import '../models/album.dart';

class AlbumsMaster extends StatelessWidget {
  const AlbumsMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("Albums"),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: Center(
            child: FutureBuilder(
                future: AlbumService.fetchAlbums(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      debugPrint('Error fetching albums: ${snapshot.error}');
                      return Center(
                        child: Text('${snapshot.error}',
                            style: const TextStyle(fontSize: 18)),
                      );
                    }
                    if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No albums found'),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        final Album? album = snapshot.data?[index];
                        return Card(
                            elevation: 2,
                            margin: const EdgeInsets.all(8),
                            child: AlbumPreview(album: album)
                        );
                      },
                    );
                  }

                  return const CircularProgressIndicator();
                }
            )
        ),
      ),
    );
  }
}
