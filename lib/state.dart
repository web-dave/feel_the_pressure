import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];
  void update() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFav() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    print(favorites);
    notifyListeners();
  }
}
