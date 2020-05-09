import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'pokemon.dart';

class PokemonStatsParseModel extends ParseObject implements ParseCloneable {
  PokemonStatsParseModel() : super(_keyTableName);

  PokemonStatsParseModel.clone() : this();

  @override
  PokemonStatsParseModel clone(Map map) =>
      PokemonStatsParseModel.clone()..fromJson(map);

  static const String keyAttack = 'attack';
  static const String keyDefense = 'defense';
  static const String keyHp = 'hp';
  static const String keyPokemon = 'pokemon';
  static const String keySpecialAttack = 'specialAttack';
  static const String keySpecialDefense = 'specialDefense';
  static const String keySpeed = 'speed';

  static const String _keyTableName = 'PokemonStats';

  PokemonParseModel get pokemon => get<PokemonParseModel>(keyPokemon);

  int get attack => get<int>(keyAttack);

  int get specialAttack => get<int>(keySpecialAttack);

  int get defense => get<int>(keyDefense);

  int get specialDefense => get<int>(keySpecialDefense);

  int get hp => get<int>(keyHp);

  int get speed => get<int>(keySpeed);
}
