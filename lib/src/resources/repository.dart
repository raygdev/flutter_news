import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider(),
  ];

  List<Cache> caches = <Cache>[
    newsDbProvider
  ];

  // Get fetchTopIds implemented
  Future<List<int>> fetchTopIds() async  {
    // look into all this casting. It doesn't feel right.
    return sources[1].fetchTopIds() as List<int>;
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel? item;
    Source source;

    for (source in sources) {
      item = await source.fetchItem(id);

      if(item != null) {
        break;
      }

    }

    for(var cache in caches) {
      cache.addItem(item as ItemModel);
    }
      return item as ItemModel;
  }
}

abstract class Source {
  Future<List<int>>? fetchTopIds();
  Future<ItemModel?> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
}