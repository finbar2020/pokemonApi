import 'dart:convert';

import 'package:pokemon_api/src/core/errors/exceptions.dart';
import 'package:pokemon_api/src/core/network/client_service.dart';
import 'package:pokemon_api/src/data/models/pokemon_model.dart';

abstract class RemoteDataSource {
  Future<List<PokemonModel>> getPokemonList(int limit, int offset);
  Future<List<PokemonModel>> getPokemon(String name);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({
    required this.client,
  });

  final ClientService client;

  @override
  Future<List<PokemonModel>> getPokemonList(int limit, int offset) async {
    final response = await client.get('?limit=$limit&offset=$offset');

    if (response.statusCode == 200) {
      final results = json.decode(response.body)['results'] as List;
      final List<PokemonModel> pokemonList = [];

      for (var i = 0; i < results.length; i++) {
        pokemonList.add((await getPokemon(results[i]['name']))[0]);
      }

      return pokemonList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PokemonModel>> getPokemon(String name) async {
    final response = await client.get('/$name');

    if (response.statusCode == 200) {
      return [PokemonModel.fromJson(json.decode(response.body))];
    } else {
      throw ServerException();
    }
  }
}
