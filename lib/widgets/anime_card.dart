import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:motion_anime_list/models/anime_model.dart';

class AnimeCard extends StatefulWidget {
  final Anime anime;

  const AnimeCard({super.key, required this.anime});

  @override
  State<AnimeCard> createState() => _AnimeCardState();
}

class _AnimeCardState extends State<AnimeCard> {
  late bool isFav = false;

  void setIsFavorite() {
    var favoriteBox = Hive.box('fav-anime');
    if(favoriteBox.containsKey(widget.anime.title)) {
      setState(() {
        isFav = true;
      });
    }
  }

  void addToFavorite() {
    var favoriteBox = Hive.box('fav-anime');
    favoriteBox.put(
      widget.anime.title,
      Anime(
        title: widget.anime.title,
        image: widget.anime.image,
        type: widget.anime.type,
        episodes: widget.anime.episodes,
        rank: widget.anime.rank,
        score: widget.anime.score,
      ),
    );
  }

  void removeFromFavorite() {
    var favoriteBox = Hive.box('fav-anime');
    favoriteBox.delete(widget.anime.title);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setIsFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            alignment: AlignmentGeometry.bottomRight,
            children: [
              Image.network(
                widget.anime.image,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.deepOrange[900],
                ),
                child: IconButton(
                  onPressed: () {
                    isFav ? removeFromFavorite() : addToFavorite();
                    setState(() {
                      isFav = !isFav;
                    });
                  },
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_outline,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepOrange[50],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.anime.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Type", style: TextStyle(fontSize: 12)),
                        Text(widget.anime.type),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Episodes", style: TextStyle(fontSize: 12)),
                        Text(widget.anime.episodes.toString()),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Score", style: TextStyle(fontSize: 12)),
                        Text(widget.anime.score.toString()),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rank", style: TextStyle(fontSize: 12)),
                        Text(widget.anime.rank.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
