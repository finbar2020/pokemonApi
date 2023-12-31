import 'package:get_it/get_it.dart';
import 'package:pokemon_api/src/core/connections/db_provider.dart';
import 'package:pokemon_api/src/core/network/client_service.dart';
import 'package:pokemon_api/src/data/data_sources/local_data_source.dart';
import 'package:pokemon_api/src/data/data_sources/remote_data_source.dart';
import 'package:pokemon_api/src/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_api/src/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_api/src/domain/use_cases/get_pokemon.dart';
import 'package:pokemon_api/src/domain/use_cases/get_pokemon_list.dart';
import 'package:pokemon_api/src/presentation/blocs/blocs.dart';

final getIt = GetIt.instance;

void init() {
  // Core
  getIt
    ..registerLazySingleton(() => ClientService())
    ..registerLazySingleton(() => DBProvider.instance)

    // Use case
    ..registerLazySingleton(() => GetPokemonList(getIt()))
    ..registerLazySingleton(() => GetPokemon(getIt()))

    // BLoC
    ..registerFactory(() => PokemonCubit(getIt(), getIt()))
    ..registerFactory(() => DetailsCubit(getIt()))

    // Repository
    ..registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl(
          remoteDataSource: getIt(),
          localDataSource: getIt(),
        ))

    // Data sources
    ..registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(client: getIt()))
    ..registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(dbProvider: getIt()));
}
