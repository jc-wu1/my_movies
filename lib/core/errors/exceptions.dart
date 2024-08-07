import '../network/error_message_model.dart';

/// Exception thrown when a server error occurs.
///
/// This exception contains an [ErrorMessageModel] which provides details
/// about the error.
class ServerException implements Exception {
  /// The error message model containing details about the server error.
  final ErrorMessageModel errorMessageModel;

  /// Creates a new instance of [ServerException] with the provided [errorMessageModel].
  const ServerException({required this.errorMessageModel});
}

/// Exception thrown when a local database error occurs.
///
/// This exception does not contain any additional information.
class LocalDbException implements Exception {}
