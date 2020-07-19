import 'package:elastic_client/console_http_transport.dart';
import 'package:elastic_client/elastic_client.dart' as elastic;

main() async {
  print(await elasticQuery('B'));
}

Future<String> elasticQuery(String query) async
{
  ConsoleHttpTransport _transport = new ConsoleHttpTransport(Uri.parse('http://localhost:9200/'));
  Client _client = new elastic.Client(_transport);
  String results = "";

  SearchResult queryResult = await _client.search(
      'foods', '_doc',
      elastic.Query.match('Name', 'Vollkornbrot'),
      source: ['Name']
    );

  print(queryResult.toMap());
  // for (dynamic entry in queryResult.toMap().entries)
  // {
  //   results += entry['doc']['Name'] + "\n";
  // }
  _transport.close();
  return results;
}