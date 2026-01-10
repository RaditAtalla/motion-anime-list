import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_anime_list/controllers/anime_controller.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    AnimeController animeC = Get.find<AnimeController>();
    TextEditingController inputC = TextEditingController();

    return Dialog(
      backgroundColor: Colors.deepOrange[50],
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Search", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            TextField(
              autofocus: true,
              controller: inputC,
              decoration: InputDecoration(
                hintText: "Keyword",
                border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
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
                  onPressed: () {
                    print("pressed");
                    animeC.search(inputC.text);
                    Navigator.pop(context);
                  },
                  child: Text("Search"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
