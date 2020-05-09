import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../../domain/entities/pokemon.dart';

class PokemonParseModel extends ParseObject implements ParseCloneable {
  PokemonParseModel() : super(_keyTableName);

  PokemonParseModel.clone() : this();

  @override
  PokemonParseModel clone(Map map) => PokemonParseModel.clone()..fromJson(map);

  static const String keyDescription = 'description';
  static const String keyEggGroups = 'eggGroups';
  static const String keyGenera = 'genera';
  static const String keyHeight = 'height';
  static const String keyImage = 'image';
  static const String keyName = 'name';
  static const String keyNumber = 'number';
  static const String keyTypes = 'types';
  static const String keyWeight = 'weight';

  // keys
  static const String _keyTableName = 'Pokemon';

  // queries
  static QueryBuilder<PokemonParseModel> queryBuilder() =>
      QueryBuilder<PokemonParseModel>(PokemonParseModel());

  String get number => get<String>(keyNumber);

  String get name => get<String>(keyName);

  String get description => get<String>(keyDescription);

  List<String> get types => get<List>(keyTypes)?.cast<String>() ?? <String>[];

  String get image => get<String>(keyImage);

  double get height => get<num>(keyHeight)?.toDouble() ?? 0.0;

  double get weight => get<num>(keyWeight).toDouble() ?? 0.0;

  String get genera => get<String>(keyGenera);

  List<String> get eggGroups =>
      get<List>(keyEggGroups)?.cast<String>() ?? <String>[];
}

extension PokemonParseModelX on PokemonParseModel {
  Pokemon toEntity() => Pokemon(
        number: number,
        name: name,
        description: description,
        types: types,
        image: image,
        height: height,
        weight: weight,
        genera: genera,
        eggGroups: eggGroups,
      );
}
