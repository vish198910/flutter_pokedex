import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'di/injection.dart';
import 'ui/screens/home/home.dart';
import 'ui/screens/pokedex/pokedex.dart';
import 'ui/screens/pokemon_info/pokemon_info.dart';
import 'ui/screens/splash/splash.dart';
import 'ui/widgets/fade_page_route.dart';

enum Routes { splash, home, pokedex, pokemonInfo }

class _Paths {
  static const String splash = '/';
  static const String home = '/home';
  static const String pokedex = '/home/pokedex';
  static const String pokemonInfo = '/home/pokemon';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
    Routes.pokedex: _Paths.pokedex,
    Routes.pokemonInfo: _Paths.pokemonInfo,
  };

  static String of(Routes route) => _pathMap[route];
}

@lazySingleton
class AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: SplashScreen());

      case _Paths.pokedex:
        return FadeRoute(page: PokedexScreen());

      case _Paths.pokemonInfo:
        return FadeRoute(page: PokemonInfo());

      case _Paths.home:
      default:
        return FadeRoute(page: HomeScreen());
    }
  }

  static AppNavigator instance() => getIt<AppNavigator>();

  static Future push(Routes route) =>
      instance().state.pushNamed(_Paths.of(route));

  static Future replaceWith(Routes route) =>
      instance().state.pushReplacementNamed(_Paths.of(route));

  static void pop() => instance().state.pop();

  NavigatorState get state => navigatorKey.currentState;
}
