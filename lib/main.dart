import 'package:flutter/material.dart';
import 'package:motion_anime_list/models/anime_model.dart';
import 'package:motion_anime_list/screens/favorite_screen.dart';
import 'package:motion_anime_list/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AnimeAdapter());

  await Hive.openBox('fav-anime');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        "home": (context) => const HomeScreen(),
        "favorite": (context) => const FavoriteScreen(),
      },
    );
  }
}
