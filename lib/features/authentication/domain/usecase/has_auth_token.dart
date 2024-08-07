import '../../../../core/usecase/base_use_case.dart';
import '../repository/authentication_repository.dart';

/// A use case for checking if an authentication token exists.
///
/// This class encapsulates the logic for checking whether an authentication token
/// is available in the repository. It provides a method to execute the check for
/// the existence of an authentication token.
class HasAuthToken {
  final AuthenticationRepository repository;

  /// Creates an instance of [HasAuthToken].
  ///
  /// [repository] - The [AuthenticationRepository] instance used to interact with the
  /// data source to check the existence of the authentication token.
  HasAuthToken(this.repository);

  /// Executes the use case to check if an authentication token exists.
  ///
  /// This method calls the [hasAuthToken] method on the [AuthenticationRepository] to
  /// determine if an authentication token is available.
  ///
  /// [p] - This parameter is not used in the execution of this use case and is
  /// typically provided for consistency with other use cases that might require parameters.
  ///
  /// Returns a [Future] that completes with a [bool] indicating the presence of
  /// the authentication token:
  /// - [true] if an authentication token exists.
  /// - [false] if no authentication token exists.
  Future<bool> call(
    NoParameters p,
  ) async {
    return await repository.hasAuthToken();
  }
}
