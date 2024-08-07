import '../../../../core/local_models/user_account.dart';
import '../repository/authentication_repository.dart';

/// A use case for saving an authentication token.
///
/// This class encapsulates the logic for saving an authentication token
/// to the repository. It provides a method to execute the saving operation
/// for user authentication.
class SaveAuthToken {
  final AuthenticationRepository repository;

  /// Creates an instance of [SaveAuthToken].
  ///
  /// [repository] - The [AuthenticationRepository] instance used to interact with the
  /// data source to save the authentication token.
  SaveAuthToken(this.repository);

  /// Executes the use case to save an authentication token.
  ///
  /// This method calls the [saveAuthToken] method on the [AuthenticationRepository]
  /// to save the provided [UserAccount] data.
  ///
  /// [p] - The [UserAccount] instance containing the authentication token to be saved.
  ///
  /// Returns a [Future] that completes when the authentication token has been saved.
  Future<void> call(
    UserAccount p,
  ) async {
    return await repository.saveAuthToken(p);
  }
}
