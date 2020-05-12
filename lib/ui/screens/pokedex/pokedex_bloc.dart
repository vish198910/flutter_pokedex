import 'package:injectable/injectable.dart';

import '../../../core/bloc.dart';
import '../../../core/bloc_state.dart';
import '../../../core/fetch_state.dart';
import '../../../domain/usecases/pokemon_usecases.dart';

@injectable
class PokedexBloc extends Bloc {
  PokedexBloc(this._getPokemonsUseCase);

  final GetPokemonsUseCase _getPokemonsUseCase;

  final _FabMenuBlocState fabMenu = _FabMenuBlocState();
  final _PokemonBlocState pokemonState = _PokemonBlocState();

  @override
  void dispose() {
    fabMenu.dispose();
    pokemonState.dispose();
  }

  void getPokemons() async {
    try {
      pokemonState.add(LoadingState());

      final pokemons = await _getPokemonsUseCase(GetPokemonParams(
        page: 0,
        limit: 20,
      ));

      if (pokemons.isEmpty) {
        pokemonState.add(EmptyState());
      } else {
        pokemonState.add(SuccessState(pokemons));
      }
    } on Exception catch (e) {
      pokemonState.add(ErrorState(e));
    }
  }
}

class _FabMenuBlocState extends BlocState<bool> {
  _FabMenuBlocState() : super(defaultValue: false);

  bool get isShowFab => value;

  void toggle() => add(!isShowFab);
}

class _PokemonBlocState extends BlocState<FetchState> {
  _PokemonBlocState() : super(defaultValue: LoadingState());
}
