import 'package:flutter/material.dart';
import 'package:motion_anime_list/components/anime_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          leading: Image.asset("logo.png"),
          leadingWidth: 40,
          title: Text("MotionAnimeList"),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    backgroundColor: Colors.deepOrange[50],
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: .start,
                        children: [
                          Text("Search", style: TextStyle(fontSize: 20)),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Keyword",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("Search"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "favorite");
              },
              icon: Icon(Icons.favorite_outline),
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: GridView.builder(
            padding: EdgeInsets.all(20),
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 500,
              crossAxisCount: 2,
              crossAxisSpacing: 10
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
