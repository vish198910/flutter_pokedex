import 'package:injectable/injectable.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:pokedex/env/env.dart';

import '../../../core/exceptions.dart';
import 'models/pokemon.dart';

@lazySingleton
class ParseDataSource {
  final Env env;

  ParseDataSource({this.env});

  Future<List<PokemonParseModel>> getPokemons({int page, int limit}) async {
    final queryBuilder = PokemonParseModel.queryBuilder()
      ..setLimit(limit)
      ..setAmountToSkip(page * limit);

    final response = await queryBuilder.query<PokemonParseModel>();

    if (response.success) {
      return response.results;
    } else {
      throw ServerException();
    }
  }
}
