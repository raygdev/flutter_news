import 'package:flutter_news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  
  test('fetchTopIds returns a list of ids', () async {
    //setup test case
    final newsApi = NewsApiProvider();
    newsApi.client =  MockClient((request) async {
      return Response(json.encode([1,2,3]), 200);
    });

    //expectation
    final ids = await newsApi.fetchTopIds();

    expect(ids, [1,2,3]);
  });
  test('fetchItem returns an item model', () async {
    //setup test case
    final newsApi = NewsApiProvider();
    newsApi.client =  MockClient((request) async {
      return Response(json.encode({
        'id': 123,
        'deleted': false,
        'type': 'type',
        'by': 'by',
        'time': 0,
        'text': 'text',
        'dead': false,
        'parent': 0,
        'kids': [1,2,3],
        'url': 'url',
        'score': 0,
        'title': 'Title',
        'descendants': 0
      }), 200);
    });

    //expectation
    final item = await newsApi.fetchItem(999);

    expect(item.id, 123);
  });
}