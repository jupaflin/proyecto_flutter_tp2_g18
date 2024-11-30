import "package:flutter/material.dart";
import "../widgets/create_card.dart";

class CardSwiper extends StatelessWidget {
  final List<List<dynamic>> items; // Lista de datos que recibe el widget
  const CardSwiper({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: PageView.builder(
        controller:
            PageController(viewportFraction: 0.8), // Espaciado entre tarjetas
        itemCount: items.length, // Usamos 'items' en lugar de 'item'
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = items[index]; // Accedemos a cada elemento de la lista
          return GestureDetector(
            onTap: () {
              // Navegación a detalles del lanzamiento
              Navigator.pushNamed(
                context,
                "newrelease_item",
                arguments: {
                  "title": item[0],
                  "release_date": item[2],
                  "imagen": item[1],
                  "nro": item[3],
                  "artist": item[4]
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardScreen(
                title: item[0], // Título del álbum
                body: "By ${item[4]} - ${item[2]}", // Artista y fecha
                url: item[1], // URL de la imagen
              ),
            ),
          );
        },
      ),
    );
  }
}
