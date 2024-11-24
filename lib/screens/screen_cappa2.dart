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
              height: size.height * 0.40,
              color: const Color(0xff2d3e4f),
              child: Center(
                child: CircleAvatar(
                radius: 100,
                child: Image.network(args['cargo']),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}