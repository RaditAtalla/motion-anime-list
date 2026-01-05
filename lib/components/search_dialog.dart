import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                TextButton(onPressed: () {}, child: Text("Search")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
