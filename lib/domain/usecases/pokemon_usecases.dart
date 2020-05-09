import 'package:injectable/injectable.dart';
import 'package:pokedex/core/usecase.dart';
import 'package:pokedex/data/repositories/pokemon_repository.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

class GetPokemonParams {
  final int page;
  final int limit;

  const GetPokemonParams({this.page, this.limit});
}

@lazySingleton
class GetPokemonsUseCase extends UseCase<List<Pokemon>, GetPokemonParams> {
  final PokemonRepository repository;

  const GetPokemonsUseCase(this.repository);

  @override
  Future<List<Pokemon>> call(GetPokemonParams params) {
    return repository.getPokemons(page: params.page, limit: params.limit);
  }
}
