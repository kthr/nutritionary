import 'package:elastic_client/console_http_transport.dart';
import 'package:elastic_client/elastic_client.dart' as elastic;

class FoodEntry{
  
  int _id = -1;
  String _category = "";
  String _name = "";
  int _average_portion = -1;
  double _energy = -1.0;// use Kilocalories
  double _protein = -1.0;
  double _fat = -1;
  double _carbohydrates = -1;
  double  _water = -1.0;
  double _fibres = -1.0;
  double _rawAsh = -1.0;
  double _organicAcids = -1.0;
  double _alcohol = -1.0;
  double _kitchenWaste =  -1.0;
  double _vitaminA =  -1.0;
  double _vitaminD =  -1.0;
  double _vitaminE =  -1.0;
  double _vitaminK =  -1.0;
  double _vitaminB1 =  -1.0;
  double _vitaminB2 =  -1.0;
  double _vitaminB3 =  -1.0;
  double _vitaminB5 =  -1.0;
  double _vitaminB6 =  -1.0;
  double _vitaminB7 =  -1.0;
  double _vitaminB9 =  -1.0;
  double _vitaminB12 =  -1.0;
  double _vitaminC =  -1.0;
  double _sodium =  -1.0;
  double _potassium =  -1.0;
  double _calcium =  -1.0;
  double _magnesium =  -1.0;
  double _phospor =  -1.0;
  double _sulphur =  -1.0;
  double _chlorine =  -1.0;
  double _iron =  -1.0;
  double _zink =  -1.0;
  double _copper =  -1.0;
  double _manganese =  -1.0;
  double _fluorine =  -1.0;
  double _iodine =  -1.0;
  double _mannite =  -1.0;
  double _sorbitol =  -1.0;
  double _xylitol =  -1.0;
  double _glucose =  -1.0;
  double _fructose =  -1.0;
  double _galactose =  -1.0;
  double _monoSaccharide =  -1.0;
  double _saccharose =  -1.0;
  double _maltose =  -1.0;
  double _lactose =  -1.0;
  double _disaccharide =  -1.0;
  double _oligosaccharideResorbable =  -1.0;
  double _oligosaccharideNonResorbable =  -1.0;
  double _glycogen =  -1.0;
  double _starch =  -1.0;
  double _polycaccharide =  -1.0;
  double _column =  -1.0;
  double _polyHexosen =  -1.0;
  double _polyUronicAcid =  -1.0;
  double _cellulose =  -1.0;
  double _lignin =  -1.0;
  double _waterSolubleFibre =  -1.0;
  double _nonWaterSolubleFibre =  -1.0;
  double _isoleucine =  -1.0;
  double _leucine =  -1.0;
  double _lysine =  -1.0;
  double _methionine =  -1.0;
  double _cysteine =  -1.0;
  double _phenylalanine =  -1.0;
  double _tyrosine =  -1.0;
  double _thereonine =  -1.0;
  double _tryptophane =  -1.0;
  double _valine =  -1.0;
  double _arginine =  -1.0;
  double _histidine =  -1.0;
  double _alanine =  -1.0;
  double _asparagineAcid =  -1.0;
  double _glutamineAcid =  -1.0;
  double _glaycine =  -1.0;
  double _proline =  -1.0;
  double _serine =  -1.0;
  double _uricAcid =  -1.0;
  double _purinN =  -1.0;
  double _butanoicAcid =  -1.0;
  double _caproicAcid =  -1.0;
  double _caprylicAcid =  -1.0;
  double _caprynicAcid =  -1.0;
  double _laurinicAcid =  -1.0;
  double _myristinicAcid =  -1.0;
  double _pentadecanicAcid =  -1.0;
  double _hexadecanicAcid =  -1.0;
  double _heptadecanicAcid =  -1.0;
  double _stearicAcid =  -1.0;
  double _arachidicAcid =  -1.0;
  double _decosanicAcid =  -1.0;
  double _tetracosanicAcid =  -1.0;
  double _saturatedFattyAcids =  -1.0;
  double _tetradecenicAcid =  -1.0;
  double _pentadecenicAcid =  -1.0;
  double _palmitoleicAcid =  -1.0;
  double _heptadecenicAcid =  -1.0;
  double _oleicAcid =  -1.0;
  double _eicosenicAcid =  -1.0;
  double _decosenicAcid =  -1.0;
  double _tetracosenicAcid =  -1.0;
  double _hexadecadienicAcid =  -1.0;
  double _hexadecattetrenicAcid =  -1.0;
  double _linoleicAcidW6 =  -1.0;
  double _linolenicAcidW3 =  -1.0;
  double _stearidonicAcid =  -1.0;
  double _nonadecatrienicAcid =  -1.0;
  double _eicosadienicAcid =  -1.0;
  double _eicosatrienicAcid =  -1.0;
  double _eicosatetraenicAcid =  -1.0;
  double _eicodonicAcid =  -1.0;
  double _docosadienicAcid =  -1.0;
  double _docosatrienicAcid =  -1.0;
  double _docosatetraenicAcid =  -1.0;
  double _docosapentaenicAcid =  -1.0;
  double _docosahexaenicAcid =  -1.0;
  double _glycerolLipoids =  -1.0;
  double _cholesterol =  -1.0;
  double _oxalicAcid =  -1.0;
  double _lacticAcid =  -1.0;
  double _citricAcid =  -1.0;
  double _malicAcid =  -1.0;
  double _tartaricAcid =  -1.0;
  double _paraCoumaricAcid =  -1.0;
  double _succinicAcid =  -1.0;
  double _caffeicAcid =  -1.0;
  double _chlorogenicAcid =  -1.0;
  double _quinicAcid =  -1.0;
  double _ferulicAcid =  -1.0;
  double _azoticFactor =  -1.0;

  

  FoodEntry(int id, String name) {
    _id = id;
    _name = name;
  }

  static Future<List<FoodEntry>> searchByName(String name) async {
    List<FoodEntry> entries = List<FoodEntry>();
    ConsoleHttpTransport _transport = new ConsoleHttpTransport(Uri.parse('http://localhost:9200/'));
    Client _client = new elastic.Client(_transport);
    SearchResult queryResult = await _client.search('foods', '_doc', elastic.Query.match('Name', name), source: ['Name']);
    for (dynamic entry in queryResult.toMap()['hits']) {
      entries.add(new FoodEntry(int.parse(entry['_id']), entry['doc']['Name']));
    }
    return entries;
  }

  int get id {
    return _id;
  }
  String get name {
    return _name;
  }
}