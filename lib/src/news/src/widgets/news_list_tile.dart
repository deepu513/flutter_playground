import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playground/src/news/src/blocs/stories_provider.dart';
import 'package:flutter_playground/src/news/src/models/item_models.dart';
import 'package:flutter_playground/src/news/src/widgets/loading_container.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({@required this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return LoadingContainer();
            }
            return buildTile(itemSnapshot.data);
          },
        );
      },
    );
  }

  Widget buildTile(ItemModel item) {
    return Column(children: [
      ListTile(
        title: Text(item.title),
        subtitle: Text('${item.score} points'),
        trailing: Column(
          children: <Widget>[
            Icon(Icons.comment),
            Text('${item.descendants}'),
          ],
        ),
      ),
      Divider(
        height: 8.0,
      ),
    ]);
  }
}
