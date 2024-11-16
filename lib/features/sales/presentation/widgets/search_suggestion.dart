import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retailpi/core/data/search_suggestion_data.dart';

class SearchSuggestion extends ConsumerWidget {
  void Function(String) onSuggestion;
  SearchSuggestion({super.key, required this.onSuggestion});
  String sampleSuggestion = 'heloworldareyouokayinthisworld';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              itemCount: SearchSuggestionData.typeShorcuts.length,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 40,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                return GridTile(
                  child: Container(
                    color: Colors.amber,
                    child: Center(
                      child: TextButton(
                        child: Text(
                          SearchSuggestionData.typeShorcuts[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 8),
                        ),
                        onPressed: () {
                          onSuggestion(
                              SearchSuggestionData.typeShorcuts[index]);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              itemCount: SearchSuggestionData.sizeShortcuts.length,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 40,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                return GridTile(
                  child: Container(
                    color: Colors.green,
                    child: Center(
                      child: TextButton(
                        child: Text(
                          SearchSuggestionData.sizeShortcuts[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 6,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          onSuggestion(
                              SearchSuggestionData.sizeShortcuts[index]);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(8),
                itemCount: SearchSuggestionData.brandShortcuts.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 40,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return GridTile(
                    child: Center(
                      child: TextButton(
                        child: Text(
                          SearchSuggestionData.brandShortcuts[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 6,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          onSuggestion(
                              SearchSuggestionData.brandShortcuts[index]);
                        },
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
