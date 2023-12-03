import 'package:dartz/dartz.dart';

import 'package:pokemon_api/src/core/errors/failure.dart';
import 'package:pokemon_api/src/core/params/pokemon_param.dart';
import 'package:pokemon_api/src/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemonList(PokemonParam params);
  Future<Either<Failure, List<Pokemon>>> getPokemon(String name);
}
