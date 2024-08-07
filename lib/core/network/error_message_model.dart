import 'package:equatable/equatable.dart';

/// A model class representing an error message from an API response.
///
/// This class is used to encapsulate error details including the status code,
/// status message, and success flag.
class ErrorMessageModel extends Equatable {
  /// The status code of the error.
  final int statusCode;

  /// The message associated with the error.
  final String statusMessage;

  /// A flag indicating whether the operation was successful or not.
  final bool success;

  /// Creates an instance of [ErrorMessageModel] with the provided parameters.
  ///
  /// [statusCode] - The HTTP status code of the error.
  /// [statusMessage] - The error message.
  /// [success] - A boolean indicating if the operation was successful.
  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  /// Creates an instance of [ErrorMessageModel] from a JSON map.
  ///
  /// [json] - A map containing error details from an API response.
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
      success: json['success'],
    );
  }

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
