import 'package:postgres/postgres.dart';

import 'foodEntry.dart';

class QuerySingleton {

  static final QuerySingleton _singleton = QuerySingleton._internal();

  factory QuerySingleton() {
    return _singleton;
  }

  void dispose() {
    _db.close();
  }

  QuerySingleton._internal() {
    _db = new PostgreSQLConnection(_hostname, _port, _databaseName, username:_username);
  }

  static final String _hostname = "localhost";
  static final int _port = 5432;
  static final String _databaseName = "nutritionary";
  static final String _username = "kthierbach";
  PostgreSQLConnection _db;

  Future<List<FoodEntry>> queryNames(String name) async {
    List<FoodEntry> entries = new List<FoodEntry>();
    
    if(name.length == 0)
      return entries;
    if(_db.isClosed) {
      _db = new PostgreSQLConnection(_hostname, _port, _databaseName, username:_username);
      await _db.open();
    }
    
    var results = await _db.mappedResultsQuery("SELECT * FROM foods WHERE name LIKE concat('%','" + name + "','%') LIMIT 50");
    for (final i in results) {
      var row = i['foods'];
      entries.add(FoodEntry(row['id'], row['name'], row['category']));
    }
    return entries;
  }

  Future<FoodEntry> queryFoodEntryByID(int id) async {
    var name = await _db.mappedResultsQuery("SELECT * FROM foods WHERE id = @id", substitutionValues: {'id' : id});
    var nutrients = await _db.mappedResultsQuery("SELECT * FROM nutrients WHERE id = @id", substitutionValues: {'id' : id});

    if(name.length == 1 && nutrients.length == 1)
    {
      Map<String,dynamic> tmp = name[0]['foods'];
      FoodEntry entry = FoodEntry(tmp['id'], tmp['name'], tmp['category']);
      tmp = nutrients[0]['nutrients'];
      tmp.remove("id");
      entry.addNutrients(tmp.cast<String,double>());
      return entry;
    }
    else {
      return FoodEntry(-1, "", "");
    }
  }
}