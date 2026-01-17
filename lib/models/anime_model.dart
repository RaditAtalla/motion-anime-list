import 'package:hive/hive.dart';

part 'anime_model.g.dart';

@HiveType(typeId: 1)
class Anime {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String image; 
  @HiveField(2)
  final String type;
  @HiveField(3)
  final int episodes;
  @HiveField(4)
  final int rank;
  @HiveField(5)
  final double score;
  @HiveField(6)
  bool isFavorite;

  Anime({
    required this.title,
    required this.image,
    required this.type,
    required this.episodes,
    required this.rank,
    required this.score,
    this.isFavorite = false,
  });

  factory Anime.fromData(Map<String, dynamic> data) {
    return Anime(
      title: data['title'] ?? "Title not found",
      image: data['images']['jpg']['image_url'] ?? "https://picsum.photos/200",
      type: data['type'] ?? "Type not found",
      episodes: data['episodes'] ?? 0,
      rank: data['rank'] ?? 0,
      score: data['score'] ?? 0,
    );
  }
}
