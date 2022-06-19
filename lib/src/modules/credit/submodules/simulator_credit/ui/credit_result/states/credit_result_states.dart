import '../../../../../models/credit_model.dart';

abstract class CreditResultPageState {}

class CreditResultLoadingState implements CreditResultPageState {}

class CreditResultLoadedState implements CreditResultPageState {
  final CreditModel creditModel;

  CreditResultLoadedState({
    required this.creditModel,
  });
}

class CreditResultErrorState implements CreditResultPageState {
  final String errorMessage;

  CreditResultErrorState({required this.errorMessage});
}
