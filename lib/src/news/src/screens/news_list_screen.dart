import 'package:flutter/material.dart';
import 'package:flutter_playground/src/news/src/blocs/stories_bloc.dart';
import 'package:flutter_playground/src/news/src/blocs/stories_provider.dart';
import 'package:flutter_playground/src/news/src/widgets/news_list_tile.dart';
import 'package:flutter_playground/src/news/src/widgets/refresh.dart';

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Top news'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Refresh(
          child: ListView.builder(
            itemBuilder: (context, int index) {
              bloc.fetchItem(snapshot.data[index]);

              return NewsListTile(
                itemId: snapshot.data[index],
              );
            },
            itemCount: snapshot.data.length,
          ),
        );
      },
    );
  }
}
