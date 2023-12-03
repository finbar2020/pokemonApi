import 'package:dartz/dartz.dart';
import 'package:pokemon_api/src/core/errors/failure.dart';
import 'package:pokemon_api/src/domain/entities/pokemon.dart';
import 'package:pokemon_api/src/domain/repositories/pokemon_repository.dart';

class GetPokemon {
  const GetPokemon(this.repository);

  final PokemonRepository repository;

  Future<Either<Failure, List<Pokemon>>> call(String name) =>
      repository.getPokemon(name);
}
