import 'package:isar/isar.dart';

import '../../../../core/database/isar_db.dart';
import '../../../../core/local_models/user_account.dart';

/// Abstract class defining the interface for authentication local data source operations.
abstract class AuthenticationLocalDataSource {
  /// Saves authentication data.
  ///
  /// [authData] - The user account data to be saved.
  Future<void> saveAuthData(UserAccount authData);

  /// Retrieves the authentication data.
  ///
  /// Returns a [String] representing the username of the authenticated user, or `null` if not found.
  Future<String?> getAuthData();

  /// Deletes the authentication data.
  Future<void> deleteAuthData();
}

/// Implementation of [AuthenticationLocalDataSource] using Isar database.
class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  final IsarDb _lDataSource;

  /// Creates an instance of [AuthenticationLocalDataSourceImpl].
  ///
  /// [lDataSource] - An instance of [IsarDb] for database operations.
  AuthenticationLocalDataSourceImpl({
    required IsarDb lDataSource,
  }) : _lDataSource = lDataSource;

  @override
  Future<String?> getAuthData() async {
    final db = _lDataSource.getDb();
    final user =
        await db.userAccounts.filter().usernameEqualTo("julian").findFirst();

    return user!.username;
  }

  @override
  Future<void> saveAuthData(UserAccount authData) async {
    try {
      final db = _lDataSource.getDb();
      await db.writeTxn(() async => await db.userAccounts.put(authData));
    } catch (e) {
      throw Exception('DB Operation error $e');
    }
  }

  @override
  Future<void> deleteAuthData() async {
    try {
      final db = _lDataSource.getDb();
      await db.writeTxn(() async => await db.userAccounts.clear());
    } catch (e) {
      throw Exception('DB Operation error $e');
    }
  }
}
