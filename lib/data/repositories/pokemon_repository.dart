import 'package:injectable/injectable.dart';

import '../../domain/entities/pokemon.dart';
import '../source/parse/models/pokemon.dart';
import '../source/parse/parse_datasource.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons({int limit, int page});

  Future<Pokemon> getPokemon();
}

@lazySingleton
@RegisterAs(PokemonRepository)
class PokemonDefaultRepository extends PokemonRepository {
  PokemonDefaultRepository({this.parseDataSource});

  final ParseDataSource parseDataSource;

  @override
  Future<Pokemon> getPokemon() {
    // TODO: implement getPokemon
    throw UnimplementedError();
  }

  @override
  Future<List<Pokemon>> getPokemons({int limit, int page}) async {
    final pokemonModels = await parseDataSource.getPokemons(
      limit: limit,
      page: page,
    );

    final pokemons =
        pokemonModels.map((pokemon) => pokemon.toEntity()).toList();

    return pokemons;
  }
}
