import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final String title, image, type;
  final int episodes, rank;
  final double score;

  const AnimeCard({
    super.key,
    required this.title,
    required this.image,
    required this.type,
    required this.episodes,
    required this.rank,
    required this.score
  });

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
                image,
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
                  onPressed: () {},
                  icon: Icon(Icons.favorite_outline, color: Colors.white),
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
            crossAxisAlignment: .start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text("Type", style: TextStyle(fontSize: 12)),
                        Text(type),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text("Episodes", style: TextStyle(fontSize: 12)),
                        Text(episodes.toString()),
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
                      crossAxisAlignment: .start,
                      children: [
                        Text("Score", style: TextStyle(fontSize: 12)),
                        Text(score.toString()),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text("Rank", style: TextStyle(fontSize: 12)),
                        Text(rank.toString()),
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
