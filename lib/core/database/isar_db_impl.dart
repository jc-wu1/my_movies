import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../local_models/media.dart';
import '../local_models/user_account.dart';
import 'isar_db.dart';

/// Concrete implementation of the IsarDb interface.
class IsarDbImpl implements IsarDb {
  /// Late-initialized instance of the Isar database.
  late Isar db;

  /// Cleans up the database.
  ///
  /// This method performs cleanup operations within a database transaction.
  @override
  Future<void> cleanUpDb() async {
    await db.writeTxn(() => cleanUpDb());
  }

  /// Retrieves the database instance.
  ///
  /// Returns the initialized Isar database instance.
  @override
  Isar getDb() => db;

  /// Initializes the database.
  ///
  /// This method retrieves the application documents directory and opens the
  /// Isar database with the specified schemas.
  @override
  Future<void> initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open(
      [MediaSchema, UserAccountSchema],
      directory: dir.path,
    );
  }
}
