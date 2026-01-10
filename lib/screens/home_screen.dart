import 'package:flutter/material.dart';
import 'package:motion_anime_list/controllers/anime_controller.dart';
import 'package:motion_anime_list/widgets/anime_card.dart';
import 'package:motion_anime_list/widgets/search_dialog.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final AnimeController animeC = Get.find<AnimeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          leading: Image.asset("logo.png"),
          leadingWidth: 40,
          title: Text("MotionAnimeList"),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => SearchDialog(),
                );
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "favorite");
              },
              icon: Icon(Icons.favorite_outline),
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Obx(() {
            return Column(
              children: [
                animeC.searchQuery.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Search results for: ${animeC.searchQuery.value}",
                            ),
                            TextButton(
                              onPressed: () {
                                animeC.searchQuery.value = "";
                                animeC.getAnime();
                              },
                              child: Text(
                                "Clear",
                                style: TextStyle(color: Colors.deepOrange[900]),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: animeC.animes.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 525,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      if (animeC.animes.isNotEmpty) {
                        var anime = animeC.animes[index];
                        return AnimeCard(
                          anime: anime,
                          isFav: animeC.getIsFav(anime),
                        );
                      } else {
                        return Center(child: Text("Loading..."));
                      }
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
