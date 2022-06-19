import 'package:flutter/cupertino.dart';

abstract class Failure {
  Failure({
    String? errorMessage,
    StackTrace? stackTrace,
    String? label,
    dynamic exception,
  }) {
    if (stackTrace != null) {
      debugPrintStack(label: label, stackTrace: stackTrace);
    }
  }
}

class UnknownError extends Failure {
  final String errorMessage;
  final dynamic exception;
  final StackTrace? stackTrace;
  final String? label;

  UnknownError({
    this.errorMessage = 'Unknown Error',
    this.label,
    this.exception,
    this.stackTrace,
  }) : super(
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          label: label,
          exception: exception,
        );
}

class NoInternetConnection extends Failure {
  NoInternetConnection() : super(errorMessage: 'No Internet Connection');
}

class DioServiceError extends Failure {
  DioServiceError({
    StackTrace? stackTrace,
    required String? label,
    required dynamic exception,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          errorMessage: errorMessage,
        );
}
