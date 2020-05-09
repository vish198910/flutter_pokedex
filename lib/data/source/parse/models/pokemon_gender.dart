import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'pokemon.dart';

class PokemonGenderParseModel extends ParseObject implements ParseCloneable {
  PokemonGenderParseModel() : super(_keyTableName);

  PokemonGenderParseModel.clone() : this();

  @override
  PokemonGenderParseModel clone(Map map) =>
      PokemonGenderParseModel.clone()..fromJson(map);

  static const String keyFemale = 'female';
  static const String keyGenderless = 'genderless';
  static const String keyMale = 'male';
  static const String keyPokemon = 'pokemon';

  static const String _keyTableName = 'PokemonGender';

  PokemonParseModel get pokemon => get<PokemonParseModel>(keyPokemon);

  bool get genderless => get<bool>(keyGenderless);

  int get male => get<int>(keyMale);

  int get female => get<int>(keyFemale);
}
