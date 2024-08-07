import '../../../../core/usecase/base_use_case.dart';
import '../repository/authentication_repository.dart';

/// A use case for deleting authentication data.
///
/// This class encapsulates the business logic for removing authentication data from the
/// repository. It provides a method to execute the deletion of authentication data.
class DeleteAuthData {
  final AuthenticationRepository repository;

  /// Creates an instance of [DeleteAuthData].
  ///
  /// [repository] - The [AuthenticationRepository] instance used to interact with the
  /// data source to delete authentication data.
  DeleteAuthData(this.repository);

  /// Executes the use case to delete authentication data.
  ///
  /// This method calls the [deleteAuthData] method on the [AuthenticationRepository] to
  /// remove the authentication data.
  ///
  /// [params] - This parameter is not used in the execution of this use case and is
  /// typically provided for consistency with other use cases that might require parameters.
  ///
  /// Returns a [Future] that completes when the deletion operation is complete. It does not
  /// return any value.
  Future<void> call(
    NoParameters params,
  ) async {
    return await repository.deleteAuthData();
  }
}
