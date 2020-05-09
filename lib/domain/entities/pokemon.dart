import 'dart:ui';

import 'package:pokedex/configs/colors.dart';

import 'pokemon_props.dart';

class Pokemon {
  final String number;
  final String name;
  final String description;
  final List<String> types;
  final String image;
  final double height;
  final double weight;
  final String genera;
  final List<String> eggGroups;
  final PokemonGender gender;
  final PokemonStats stats;

  Pokemon({
    this.number,
    this.name,
    this.description,
    this.types,
    this.image,
    this.height,
    this.weight,
    this.genera,
    this.eggGroups,
    this.gender,
    this.stats,
  });
}

extension PokemonX on Pokemon {
  Color get color {
    if (types.isEmpty) {
      return AppColors.lightBlue;
    }

    switch (types[0].toLowerCase()) {
      case 'grass':
      case 'bug':
        return AppColors.lightTeal;

      case 'fire':
        return AppColors.lightRed;

      case 'water':
      case 'fighting':
      case 'normal':
        return AppColors.lightBlue;

      case 'electric':
      case 'psychic':
        return AppColors.lightYellow;

      case 'poison':
      case 'ghost':
        return AppColors.lightPurple;

      case 'ground':
      case 'rock':
        return AppColors.lightBrown;

      case 'dark':
        return AppColors.black;

      default:
        return AppColors.lightBlue;
    }
  }
}
