import 'package:flutter/material.dart';
import 'package:motion_anime_list/controllers/anime_controller.dart';
import 'package:motion_anime_list/models/anime_model.dart';
import 'package:motion_anime_list/screens/favorite_screen.dart';
import 'package:motion_anime_list/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AnimeAdapter());

  await Hive.openBox('fav-anime');

  Get.put(AnimeController());


  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      getPages: [
        GetPage(name: "/", page: () => HomeScreen()),
        GetPage(name: "/favorite", page: () => FavoriteScreen()),
      ],
    );
  }
}
