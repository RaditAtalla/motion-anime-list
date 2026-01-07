import 'dart:convert';

import 'package:motion_anime_list/models/anime_model.dart';
import 'package:http/http.dart' as http;

class AnimeService {
  Future<List<Anime>> getTopAnime() async {
    final response = await http.get(Uri.parse('https://api.jikan.moe/v4/top/anime'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<dynamic> data = json['data'];
      List<Anime> animeList = [];

      for(int i = 0; i < data.length; i++) {
        Anime anime = Anime.fromData(data[i]);
        animeList.add(anime);
      }

      return animeList;
    } else {
      throw Exception("Failed fetching top anime");
    }
  }
}