import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:motion_anime_list/models/anime_model.dart';
import 'package:http/http.dart' as http;

class AnimeController extends GetxController {
  RxList animes = <Anime>[].obs;
  RxList favoriteAnimes = <Anime>[].obs;
  var favoriteBox = Hive.box('fav-anime');

  void getAnime() async {
    final response = await http.get(Uri.parse('https://api.jikan.moe/v4/top/anime'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<dynamic> data = json['data'];
      List<Anime> animeList = [];

      for(int i = 0; i < data.length; i++) {
        Anime anime = Anime.fromData(data[i]);
        animeList.add(anime);
      }

      animes.assignAll(animeList);
    } else {
      throw Exception("Failed fetching top anime");
    }
  }

  void getFavoriteAnimes() {
    List<Anime> temp = [];
    for (var anime in favoriteBox.values) {
      temp.add(anime);
    }

    favoriteAnimes.assignAll(temp);
  }

  void addToFavorite(Anime anime) {
    favoriteBox.put(anime.title, anime);
    getFavoriteAnimes();
    getAnime();
  }

  void removeFromFavorite(Anime anime) {
    favoriteBox.delete(anime.title);
    getFavoriteAnimes();
    getAnime();
  }

  bool getIsFav(Anime anime) {
    return favoriteBox.containsKey(anime.title);
  }

  @override
  void onInit() {
    super.onInit();
    getAnime();
    getFavoriteAnimes();
  }
}
