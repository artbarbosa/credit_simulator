import 'package:rispar_credit_simulator/src/core/shared/failures/failures.dart';

class SimulatorCreditDatasourceInternetConnection
    implements NoInternetConnection {}

class SimulatorCreditDatasourceError extends Failure {
  SimulatorCreditDatasourceError({
    StackTrace? stackTrace,
    required String label,
    required dynamic exception,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          errorMessage: errorMessage,
        );
}
