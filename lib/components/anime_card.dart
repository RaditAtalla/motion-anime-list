import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Image.asset(
                "dummy.png",
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.deepOrange[900],
                  borderRadius: BorderRadius.circular(100)
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_outline, color: Colors.white),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(15),
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
                  "Suzume",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text("Type", style: TextStyle(fontSize: 12)),
                            Text("TV"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text("Rating", style: TextStyle(fontSize: 12)),
                            Text("9.5"),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text("Episodes", style: TextStyle(fontSize: 12)),
                            Text("5"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text("Rank", style: TextStyle(fontSize: 12)),
                            Text("1"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
