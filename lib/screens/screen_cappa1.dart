import 'package:flutter/material.dart';
import 'package:flutter_application_base/helpers/album.dart';
import 'package:flutter_application_base/helpers/album_future.dart';

import '../widgets/create_card.dart';


class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  late Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();

    // Cargar álbumes de la lista simulada
    futureAlbums = fetchAlbumsFromMock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álbumes Simulados'),
      ),
      body: FutureBuilder<List<Album>>(
        future: futureAlbums,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final albums = snapshot.data!;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: CardScreen(
                       
                      title: album.name, 
                      body: album.id,
                      url: album.imageUrl, 
                    )
                );
              },
            );
          } else {
            return Center(child: Text('No hay datos disponibles'));
          }
        },
      ),
    );
  }
}
