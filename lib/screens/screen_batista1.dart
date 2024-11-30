import 'package:flutter/material.dart';
import 'package:flutter_application_base/mocks/newreleases_mock.dart';
import '../widgets/card_Swiper.dart';

class newreleasesScreen extends StatefulWidget {
  const newreleasesScreen({super.key});

  @override
  newreleasesScreenState createState() => newreleasesScreenState();
}

class newreleasesScreenState extends State<newreleasesScreen> {
  late List<List<dynamic>> _release;

  @override
  void initState() {
    super.initState();
    _release = mockNewReleases;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("New Releases")),
        body: Center(
          child: CardSwiper(items: _release), // Solo mostramos el CardSwiper
        ),
      ),
    );
  }
}
