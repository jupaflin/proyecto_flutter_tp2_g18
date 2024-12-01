import 'package:flutter/material.dart';
import 'package:flutter_application_base/helpers/preferences.dart';
import 'package:flutter_application_base/providers/theme_provider.dart';
import 'package:flutter_application_base/screens/screen_batista2.dart';
import 'package:flutter_application_base/screens/screens.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(isDarkMode: Preferences.darkmode),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Provider.of<ThemeProvider>(context, listen: true);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        theme: tema.temaActual,
        //theme: Preferences.darkmode ? ThemeData.dark() : ThemeData.light(),
        routes: {
          'home': (context) => const HomeScreen(),
          'profile': (context) => const ProfileScreen(),
          'albums': (context) => const AlbumsScreen(),
          'album_item': (context) => const AlbumSingleScreen(),
          'newreleases': (context) => const newreleasesScreen(),
          'newrelease_item': (context) => const newreleaseSingleScreen(),
          'genres': (context) => const GenresScreen(),
          'genre_item': (context) => const GenreSingleScreen(),
        }
        /* home: DesignScreen(), */
        );
  }
}
