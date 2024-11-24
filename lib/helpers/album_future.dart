import 'package:flutter_application_base/helpers/album.dart';
import 'package:flutter_application_base/mocks/albums_mock.dart';



Future<List<Album>> fetchAlbumsFromMock() async {
  // Simula un tiempo de carga si lo deseas
  await Future.delayed(const Duration(seconds: 1));

  // Convierte cada entrada de la lista simulada en un objeto Album
  return mockAlbums.map((item) {
    return Album(
      id: item[0],       // ID
      name: item[1],     // Nombre
      imageUrl: item[2], // URL de la imagen
    );
  }).toList();
}
