import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/authentication_repository.dart';

/// A use case for retrieving the authentication token.
///
/// This class encapsulates the logic for fetching the authentication token from the
/// repository. It provides a method to execute the retrieval of the authentication token.
class GetAuthToken extends BaseUseCase<String?, NoParameters> {
  final AuthenticationRepository repository;

  /// Creates an instance of [GetAuthToken].
  ///
  /// [repository] - The [AuthenticationRepository] instance used to interact with the
  /// data source to retrieve the authentication token.
  GetAuthToken(this.repository);

  /// Executes the use case to retrieve the authentication token.
  ///
  /// This method calls the [getAuthToken] method on the [AuthenticationRepository] to
  /// fetch the authentication token.
  ///
  /// [p] - This parameter is not used in the execution of this use case and is
  /// typically provided for consistency with other use cases that might require parameters.
  ///
  /// Returns a [Future] that completes with an [Either] value:
  /// - [Right] containing the authentication token as a [String?] if the operation is successful.
  /// - [Left] containing a [Failure] if an error occurs.
  @override
  Future<Either<Failure, String?>> call(
    NoParameters p,
  ) async {
    return await repository.getAuthToken();
  }
}
