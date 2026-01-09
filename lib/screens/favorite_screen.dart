import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:motion_anime_list/models/anime_model.dart';
import 'package:motion_anime_list/widgets/anime_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List<Anime> favoriteAnimeList = [];

  void fetchfavoriteAnime() {
    var favoriteBox = Hive.box('fav-anime');

    for (var anime in favoriteBox.values) {
      favoriteAnimeList.add(anime);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchfavoriteAnime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Favorites"),
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: GridView.builder(
            padding: EdgeInsets.all(20),
            itemCount: favoriteAnimeList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 500,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              var anime = favoriteAnimeList[index];
              return AnimeCard(anime: anime);
            },
          ),
        ),
      ),
    );
  }
}
