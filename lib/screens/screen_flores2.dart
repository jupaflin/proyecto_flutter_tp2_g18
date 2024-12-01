// screen que muestra el genero con sus detalles (descripcion)
import 'package:flutter/material.dart';

class GenreSingleScreen extends StatelessWidget {
  const GenreSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text(args['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              args['name'], 
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              args['description'], 
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
