import 'package:elastic_client/console_http_transport.dart';
import 'package:elastic_client/elastic_client.dart' as elastic;

class FoodEntry{
  
  int _id = -1;
  String _category = "";
  String _name = "";
  Map<String, double> _ingredients = new Map<String,double>();

  

  FoodEntry(int id, String name) {
    _id = id;
    _name = name;
  }

  static Future<List<FoodEntry>> searchByName(String name) async {
    List<FoodEntry> entries = List<FoodEntry>();
    ConsoleHttpTransport _transport = new ConsoleHttpTransport(Uri.parse('http://localhost:9200/'));
    Client _client = new elastic.Client(_transport);
    SearchResult queryResult = await _client.search('foods', '_doc', elastic.Query.match('Name', name), source: []);
    for (dynamic entry in queryResult.toMap()['hits']) {
      FoodEntry food = new FoodEntry(int.parse(entry['_id']), entry['doc']['Name']);
      entry['doc'].forEach((k,v) => food.addIngredient((k).toString(), (v).toString()));
      //entry['doc'].forEach((k,v) => print('${k}:${v}'));
      entries.add(food);
      
    }
    return entries;
  }

  int get id {
    return _id;
  }
  String get name {
    return _name;
  }

  List<String> get ingredientNames {
    return _ingredients.keys.toList();
  }

  double ingredientAmount(String key) {
    return _ingredients[key];
  }

  void addIngredient(String name, String amount) {
    try{
      _ingredients[name] = double.parse(amount);
    }
    on FormatException
    {
      //don't add anything if amount is not in double format
    }
  }

  int numberIngredients() {
    return _ingredients.length;
  }
}