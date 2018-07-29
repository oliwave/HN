import 'dart:async';

import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

final _root = 'https://hacker-news.firebaseiox.com/v0';

class NewsApiProvider {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final response = await client.get('$_root/topstories.json');
    final ids = json.decode(response.body);

    // indicate dart that ids is a list of integer
    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get('$_root/item/$id.json');
    final parsedJson = json.decode(response.body);

    // make the instance of ItemModel and return it
    return ItemModel.fromJson(parsedJson);
  }

}
