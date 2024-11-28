import 'package:flutter/material.dart';

class AlbumSingleScreen extends StatelessWidget {
  const AlbumSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Custom Album'),
        elevation: 10,
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.60,
              color: const Color(0xff2d3e4f),
              child: Image.network(args['imagen']),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.10,
              child: Center(
                child: Text(
                  args['titulo'],
                  style: const TextStyle(
                    fontSize: 24,
                    
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.7,
                    height: size.height * 1,
                    //color:  Colors.red,
                    child: Center(
                      child: Text(
                        'Cantidad de canciones: ${args['nro']}',//args['descripcion'],
                        style: const TextStyle(
                          fontSize: 24,
                          
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.3,
                    height: size.height * 1,
                    //color: const Color(0xff2d3e4f),
                    child: Center(
                      child: Text(
                        args['release_date'],
                        style: const TextStyle(
                          fontSize: 18,
                          
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
            onChanged: (value) {},
            style: const TextStyle(fontSize: 18),
            initialValue: args['titulo'] ?? '',
            )
          ],
        ),
      )
    );
  }
}