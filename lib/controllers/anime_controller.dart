import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:motion_anime_list/models/anime_model.dart';
import 'package:http/http.dart' as http;

class AnimeController extends GetxController {
  final String API = 'https://api.jikan.moe/v4';
  RxList animes = <Anime>[].obs;
  RxList favoriteAnimes = <Anime>[].obs;
  RxString searchQuery = "".obs;
  var favoriteBox = Hive.box('fav-anime');

  @override
  void onInit() {
    super.onInit();
    getAnime();
    getFavoriteAnimes();
  }

  void getAnime() async {
    final response = await http.get(Uri.parse("$API/top/anime"));

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

  void search(String title) async {
    searchQuery.value = title;

    final response = await http.get(Uri.parse("$API/anime?q=$title"));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<dynamic> data = json['data'];
      print(data);
      List<Anime> animeList = [];

      for(int i = 0; i < data.length; i++) {
        Anime anime = Anime.fromData(data[i]);
        animeList.add(anime);
      }

      animes.assignAll(animeList);
    } else {
      throw Exception("Failed searching anime");
    }
  }

}
