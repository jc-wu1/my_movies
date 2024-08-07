import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failures.dart';

/// Abstract class representing the base use case for handling operations.
///
/// This class defines a contract for executing operations that either succeed
/// with a result of type [T] or fail with a [Failure].
abstract class BaseUseCase<T, P> {
  /// Executes the operation with the given parameters [p].
  ///
  /// Returns a [Future] that completes with an [Either] containing a [Failure]
  /// on the left side in case of an error, or a result of type [T] on the right side
  /// if the operation is successful.
  Future<Either<Failure, T>> call(P p);
}

/// Class representing a case where no parameters are needed.
///
/// This class can be used when a use case does not require any parameters to
/// execute. It extends [Equatable] to allow for value comparisons.
class NoParameters extends Equatable {
  /// Creates an instance of [NoParameters].
  const NoParameters();

  /// Returns a list of properties to be used for equality comparison.
  @override
  List<Object?> get props => [];
}
