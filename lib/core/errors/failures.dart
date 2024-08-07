import 'package:equatable/equatable.dart';

/// Abstract class representing a failure.
///
/// This class is extended to create specific types of failures. It contains
/// a message that provides details about the failure.
abstract class Failure extends Equatable {
  /// The message describing the failure.
  final String message;

  /// Creates a new instance of [Failure] with the provided [message].
  const Failure(this.message);

  /// List of properties to be used for equality comparison.
  @override
  List<Object?> get props => [message];
}

/// Represents a failure that occurs due to a server error.
///
/// This class extends [Failure] and provides the message describing the
/// server error.
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Represents a failure that occurs due to a local database error.
///
/// This class extends [Failure] and provides the message describing the
/// local database error.
class LocalDbFailure extends Failure {
  const LocalDbFailure(super.message);
}
