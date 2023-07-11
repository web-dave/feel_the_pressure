import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;
    return Center(
        child: ListView(
      children: [for (var fav in favorites) Text(fav.asString)],
    ));
  }
}
