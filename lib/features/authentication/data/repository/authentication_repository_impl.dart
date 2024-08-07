import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/local_models/user_account.dart';
import '../../domain/repository/authentication_repository.dart';
import '../datasource/authentication_local_data_source.dart';

/// A concrete implementation of [AuthenticationRepository] that uses
/// [AuthenticationLocalDataSource] for data persistence.
///
/// This class provides the actual logic for saving, retrieving, checking, and
/// deleting authentication data using a local data source.
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationLocalDataSource localDataSource;

  /// Creates an instance of [AuthenticationRepositoryImpl].
  ///
  /// [localDataSource] - The local data source used for storing and retrieving
  /// authentication data.
  AuthenticationRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveAuthToken(UserAccount authData) async {
    await localDataSource.saveAuthData(authData);
  }

  @override
  Future<Either<Failure, String?>> getAuthToken() async {
    try {
      final authData = await localDataSource.getAuthData();
      if (authData != null) {
        return Right(authData);
      } else {
        return const Left(LocalDbFailure("User not found"));
      }
    } catch (e) {
      return Left(LocalDbFailure("Error in local db ${e.toString()}"));
    }
  }

  @override
  Future<bool> hasAuthToken() async {
    try {
      final authToken = await localDataSource.getAuthData();
      if (authToken != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> deleteAuthData() async {
    await localDataSource.deleteAuthData();
  }
}
