import 'package:flutter/material.dart';
import 'package:motion_anime_list/components/anime_card.dart';
import 'package:motion_anime_list/components/search_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 500,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return AnimeCard();
            },
          ),
        ),
      ),
    );
  }
}
