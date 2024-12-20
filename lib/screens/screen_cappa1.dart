import 'package:flutter/material.dart';
import 'package:flutter_application_base/helpers/album.dart';
import 'package:flutter_application_base/mocks/albums_mock.dart';

import '../widgets/create_card.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  late Future<List<Album>> futureAlbums;
  //String _searchQuery = '';
  List _albums = [];

  @override
  void initState() {
    super.initState();
    _albums = mockAlbums;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [albums_list_area()],
      ),
    ));
  }

  Expanded albums_list_area() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _albums.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'album_item',
                    arguments: <String, dynamic>{
                      'titulo': mockAlbums[index][0],
                      'release_date': mockAlbums[index][1],
                      'imagen': mockAlbums[index][2],
                      'nro': mockAlbums[index]
                          [3], //total de canciones del album
                    });
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardScreen(
                  title: mockAlbums[index][0], // mockAlbums[index][0]
                  body: mockAlbums[index][1],
                  url: mockAlbums[index][2],
                ),
              ));
        },
      ),
    );
  }
}
