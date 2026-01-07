class Anime {
  final String title, image, type;
  final int episodes, rank;
  final double score;

  Anime({
    required this.title,
    required this.image,
    required this.type,
    required this.episodes,
    required this.rank,
    required this.score,
  });

  factory Anime.fromData(Map<String, dynamic> data) {
    return Anime(
      title: data['title'],
      image: data['images']['jpg']['image_url'],
      type: data['type'],
      episodes: data['episodes'],
      rank: data['rank'],
      score: data['score'],
    );
  }

  factory Anime.fromJson(Map<String, dynamic> json) {
    var data = json['data'][0];

    return Anime(
      title: data['title'],
      image: data['images']['jpg']['image_url'],
      type: data['type'],
      episodes: data['episodes'],
      rank: data['rank'],
      score: data['score'],
    );
  }
}
