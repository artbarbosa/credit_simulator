import 'package:flutter_test/flutter_test.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/ui/input_amount/controller/input_amount_controller.dart';

void main() {
  late InputAmountController controller;

  setUpAll(() {
    controller = InputAmountController();
  });
  group('InputAmountController - setValue', () {
    test('Should change to 2000', () async {
      controller.setValue('2.000');
      final result = controller.value;
      expect(result, 2000);
    });
  });
  group('InputAmountController - validateAmount', () {
    test('Should return null', () async {
      final result = controller.validateAmount('2.000');
      expect(result, null);
    });
    test('Should return String empty', () async {
      final result = controller.validateAmount('50');
      expect(result, '');
    });

    test('Should return String empty', () async {
      final result = controller.validateAmount('');
      expect(result, '');
    });
  });
}
