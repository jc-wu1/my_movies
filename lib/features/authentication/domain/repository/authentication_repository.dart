import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/user_account.dart';

/// A repository for managing user authentication data.
///
/// The `AuthenticationRepository` abstract class defines the contract for
/// handling user authentication tokens. It includes methods for saving,
/// retrieving, checking, and deleting authentication data.
///
/// Implementations of this class should provide concrete behavior for
/// persisting and managing authentication information.
abstract class AuthenticationRepository {
  /// Saves the provided authentication token.
  ///
  /// This method takes a `UserAccount` object containing authentication data
  /// and saves it to the repository.
  ///
  /// Example:
  /// ```dart
  /// await authenticationRepository.saveAuthToken(userAccount);
  /// ```
  ///
  /// [authData] - The authentication data to be saved.
  ///
  /// Returns a [Future] that completes when the save operation is complete.
  Future<void> saveAuthToken(UserAccount authData);

  /// Retrieves the stored authentication token.
  ///
  /// This method fetches the authentication token from the repository.
  /// It returns either the token as a `String` or an error encapsulated in
  /// a `Failure` object if an error occurs or the token is not found.
  ///
  /// Example:
  /// ```dart
  /// final result = await authenticationRepository.getAuthToken();
  /// result.fold(
  ///   (failure) => print('Error: ${failure.message}'),
  ///   (token) => print('Token: $token'),
  /// );
  /// ```
  ///
  /// Returns a [Future] that completes with an [Either] containing:
  /// - [Right] with the token if successful, or
  /// - [Left] with a [Failure] if an error occurs.
  Future<Either<Failure, String?>> getAuthToken();

  /// Checks if an authentication token exists.
  ///
  /// This method determines whether an authentication token is currently
  /// stored in the repository.
  ///
  /// Example:
  /// ```dart
  /// final hasToken = await authenticationRepository.hasAuthToken();
  /// if (hasToken) {
  ///   print('Token exists');
  /// } else {
  ///   print('No token found');
  /// }
  /// ```
  ///
  /// Returns a [Future] that completes with a [bool]:
  /// - `true` if an authentication token is present, or
  /// - `false` if no token is found.
  Future<bool> hasAuthToken();

  /// Deletes the stored authentication data.
  ///
  /// This method removes the authentication token and any related data from
  /// the repository.
  ///
  /// Example:
  /// ```dart
  /// await authenticationRepository.deleteAuthData();
  /// ```
  ///
  /// Returns a [Future] that completes when the delete operation is complete.
  Future<void> deleteAuthData();
}
