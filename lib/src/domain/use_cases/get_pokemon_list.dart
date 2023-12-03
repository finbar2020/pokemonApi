import 'package:dartz/dartz.dart';
import 'package:pokemon_api/src/core/errors/failure.dart';
import 'package:pokemon_api/src/core/params/pokemon_param.dart';
import 'package:pokemon_api/src/core/use_case.dart';
import 'package:pokemon_api/src/domain/entities/pokemon.dart';
import 'package:pokemon_api/src/domain/repositories/pokemon_repository.dart';

class GetPokemonList implements UseCase<List<Pokemon>, PokemonParam> {
  GetPokemonList(this._repository);

  final PokemonRepository _repository;

  @override
  Future<Either<Failure, List<Pokemon>>> call(PokemonParam params) =>
      _repository.getPokemonList(params);
}
