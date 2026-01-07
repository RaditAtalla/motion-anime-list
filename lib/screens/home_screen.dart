import 'package:flutter/material.dart';
import 'package:motion_anime_list/widgets/anime_card.dart';
import 'package:motion_anime_list/widgets/search_dialog.dart';
import 'package:motion_anime_list/models/anime_model.dart';
import 'package:motion_anime_list/services/anime_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final animeService = AnimeService();
  late List<Anime> animeList = [];

  void fetchAnime() async {
    try {
      final topAnime = await animeService.getTopAnime();
      setState(() {
        animeList = topAnime;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAnime();
  }

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
          padding: const EdgeInsets.only(top: 50),
          child: GridView.builder(
            padding: EdgeInsets.all(20),
            itemCount: animeList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 525,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              var anime = animeList[index];
              return AnimeCard(anime: anime);
            },
          ),
        ),
      ),
    );
  }
}
