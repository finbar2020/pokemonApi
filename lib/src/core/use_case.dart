import 'package:dartz/dartz.dart';
import 'package:pokemon_api/src/core/errors/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}
