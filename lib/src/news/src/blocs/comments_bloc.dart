import 'dart:async';

import 'package:flutter_playground/src/news/src/models/item_models.dart';
import 'package:flutter_playground/src/news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class CommentsBloc {
  final _commentsFetcher = PublishSubject<int>();
  final _commentsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();
  final _repository = Repository();

  Observable<Map<int, Future<ItemModel>>> get itemWithComments =>
      _commentsOutput.stream;

  Function(int) get fetchItemWithComments => _commentsFetcher.sink.add;

  CommentsBloc() {
    _commentsFetcher.stream
        .transform(_commentsTransformer())
        .pipe(_commentsOutput);
  }

  _commentsTransformer() {
    return ScanStreamTransformer<int, Map<int, Future<ItemModel>>>(
        (Map<int, Future<ItemModel>> cache, int id, int index) {
      cache[id] = _repository.fetchItem(id);
      cache[id].then((ItemModel item) {
        item.kids.forEach((kidId) => fetchItemWithComments(kidId));
      });

      return cache;
    }, <int, Future<ItemModel>>{});
  }

  dispose() {
    _commentsFetcher.close();
    _commentsOutput.close();
  }
}
