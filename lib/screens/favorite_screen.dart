import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_anime_list/controllers/anime_controller.dart';
import 'package:motion_anime_list/widgets/anime_card.dart';

class FavoriteScreen extends StatelessWidget {
  final AnimeController animeC = Get.find<AnimeController>();

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
          child: Obx(() {
            return GridView.builder(
              padding: EdgeInsets.all(20),
              itemCount: animeC.favoriteAnimes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 525,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                var anime = animeC.favoriteAnimes[index];
                return AnimeCard(anime: anime, isFav: animeC.getIsFav(anime),);
              },
            );
          }),
        ),
      ),
    );
  }
}
