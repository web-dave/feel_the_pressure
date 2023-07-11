import 'package:b_p/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'big_card.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    var action = appState.update;
    var like = appState.toggleFav;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      BigCard(pair: pair),
      SizedBox(
        height: 5,
      ),
      Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                like();
              },
              icon: Icon(
                icon,
                color: Colors.pink,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            IconButton(
              onPressed: () {
                action();
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.pink,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
