import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final DateTime timestamp;
  final String apiEndpoint;
  final int? statusCode;
  final String errorMessage;
  final String? locationIdentifier;
  final Map<String, dynamic>? requestParameters;

  const AppError({
    required this.timestamp,
    required this.apiEndpoint,
    this.statusCode,
    required this.errorMessage,
    this.locationIdentifier,
    this.requestParameters,
  });

  @override
  List<Object?> get props => [
        timestamp,
        apiEndpoint,
        statusCode,
        errorMessage,
        locationIdentifier,
        requestParameters,
      ];
}
