import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:motion_anime_list/models/anime_model.dart';
import 'package:motion_anime_list/services/anime_services.dart';

class AnimeController extends GetxController {
  RxList animes = <Anime>[].obs;
  RxList favoriteAnimes = <Anime>[].obs;
  var favoriteBox = Hive.box('fav-anime');

  void loadAnimes() async {
    var animeService = AnimeService();
    var topAnime = await animeService.getTopAnime();
    animes.assignAll(topAnime);
  }

  void loadFavoriteAnimes() {
    List<Anime> temp = [];
    for (var anime in favoriteBox.values) {
      temp.add(anime);
    }

    favoriteAnimes.assignAll(temp);
  }

  @override
  void onInit() {
    super.onInit();
    loadAnimes();
    loadFavoriteAnimes();
  }
}
