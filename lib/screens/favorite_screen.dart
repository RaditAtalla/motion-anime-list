import 'package:flutter/material.dart';
import 'package:motion_anime_list/components/anime_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
