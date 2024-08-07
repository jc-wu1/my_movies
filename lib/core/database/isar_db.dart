import 'package:isar/isar.dart';

/// Abstract class representing the interface for interacting with an Isar database.
abstract class IsarDb {
  /// Initializes the database.
  ///
  /// This method sets up the necessary configurations and connections
  /// to make the database ready for use.
  Future<void> initDb();

  /// Retrieves the database instance.
  ///
  /// Returns an instance of the Isar database for direct interactions.
  Isar getDb();

  /// Cleans up the database.
  ///
  /// This method handles the necessary cleanup operations for the database,
  /// such as closing connections and clearing data.
  Future<void> cleanUpDb();
}
