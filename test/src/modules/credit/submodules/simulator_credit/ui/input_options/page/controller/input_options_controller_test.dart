import 'package:flutter_test/flutter_test.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/ui/input_options/page/controller/input_options_controller.dart';

void main() {
  late InputOptionsController controller;

  setUpAll(() {
    controller = InputOptionsController();
  });
  group('InputOptionsController - onChangeTerm', () {
    test('Should change term to 12', () async {
      controller.onChangeTerm(12.0);
      final result = controller.term;
      expect(result, 12);
    });
  });

  group('InputOptionsController - onChangeLtv', () {
    test('Should change ltv to 35', () async {
      controller.onChangeLtv(35.0);
      final result = controller.ltv;
      expect(result, 35);
    });
  });

  group('InputOptionsController - setHasProtected', () {
    test('Should change to 2000', () async {
      controller.setHasProtected(false);
      final result = controller.hasProtected;
      expect(result, false);
    });
  });
}
