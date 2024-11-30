import "package:flutter/material.dart";

class newreleaseSingleScreen extends StatelessWidget {
  const newreleaseSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text(arguments['title'])),
      body: Center(
        // Centra todo horizontal y verticalmente
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centra horizontalmente
          children: [
            Image.network(arguments['imagen']),
            const SizedBox(height: 16), // Espaciado entre widgets
            Text("Artist: ${arguments['artist']}"),
            const SizedBox(height: 8),
            Text("Release Date: ${arguments['release_date']}"),
            const SizedBox(height: 8),
            Text("Number of Songs: ${arguments['nro']}"),
          ],
        ),
      ),
    );
  }
}
