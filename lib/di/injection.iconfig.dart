// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:pokedex/routes.dart';
import 'package:pokedex/env/dev.env.dart';
import 'package:pokedex/env/env.dart';
import 'package:pokedex/env/stag.env.dart';
import 'package:pokedex/env/prod.env.dart';
import 'package:pokedex/ui/screens/home/home_bloc.dart';
import 'package:pokedex/data/source/parse/parse_datasource.dart';
import 'package:pokedex/data/repositories/pokemon_repository.dart';
import 'package:pokedex/domain/usecases/pokemon_usecases.dart';
import 'package:pokedex/ui/screens/pokedex/pokedex_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<AppNavigator>(() => AppNavigator());
  g.registerFactory<HomeBloc>(() => HomeBloc());
  g.registerLazySingleton<ParseDataSource>(
      () => ParseDataSource(env: g<Env>()));
  g.registerLazySingleton<PokemonRepository>(
      () => PokemonDefaultRepository(parseDataSource: g<ParseDataSource>()));
  g.registerLazySingleton<GetPokemonsUseCase>(
      () => GetPokemonsUseCase(g<PokemonRepository>()));
  g.registerFactory<PokedexBloc>(() => PokedexBloc(g<GetPokemonsUseCase>()));

  //Eager singletons must be registered in the right order
  if (environment == 'dev') {
    g.registerSingleton<Env>(DevEnv());
  }
  if (environment == 'stag') {
    g.registerSingleton<Env>(StagEnv());
  }
  if (environment == 'prod') {
    g.registerSingleton<Env>(ProdEnv());
  }
}
