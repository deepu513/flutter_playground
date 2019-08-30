import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playground/src/news/src/models/item_models.dart';
import 'package:flutter_playground/src/news/src/widgets/loading_container.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;
  final int depth;

  Comment({this.itemId, this.itemMap, this.depth});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (!snapshot.hasData) return LoadingContainer();

        final item = snapshot.data;

        final children = <Widget>[
          ListTile(
            title: buildText(item.text),
            subtitle: item.by == "" ? Text("Deleted") : Text(item.by),
            contentPadding: EdgeInsets.only(right: 16.0, left: depth * 16.0),
          ),
          Divider(),
        ];

        snapshot.data.kids.forEach((kidId) {
          children.add(
            Comment(
              itemId: kidId,
              itemMap: itemMap,
              depth: depth + 1,
            ),
          );
        });

        return Column();
      },
    );
  }

  Widget buildText(String text) {
    final filteredText = text
        .replaceAll('&#x27;', "'")
        .replaceAll("<p>", '\n\n')
        .replaceAll('</p>', '');

    return Text(filteredText);
  }
}
