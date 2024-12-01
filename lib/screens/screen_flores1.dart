//screen que muestra todos los generos a la vez
import 'package:flutter/material.dart';
import 'package:flutter_application_base/mocks/genres_mock.dart';

class GenresScreen extends StatefulWidget {
  const GenresScreen({super.key});

  @override
  _GenresScreenState createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  late List<List<dynamic>> _genres;

  @override
  void initState() {
    super.initState();
    _genres = mockGenres;       //se cargan generos desde el mock
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Genres")),
        body: ListView.builder(
          itemCount: _genres.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'genre_item', arguments: {
                  'name': _genres[index][1],
                  'description': _genres[index][2],
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text(_genres[index][1]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
