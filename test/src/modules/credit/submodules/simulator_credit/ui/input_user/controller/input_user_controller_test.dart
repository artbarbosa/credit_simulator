import 'package:flutter_test/flutter_test.dart';
import 'package:rispar_credit_simulator/src/modules/credit/submodules/simulator_credit/ui/input_user/controller/input_user_controller.dart';

void main() {
  late InputUserController controller;

  setUpAll(() {
    controller = InputUserController();
  });
  group('InputUserController - setFullName', () {
    test('Should change fullName to test', () async {
      controller.setFullName('test');
      final result = controller.fullName;
      expect(result, 'test');
    });
  });

  group('InputUserController - onChangeLtv', () {
    test('Should change email to test', () async {
      controller.setEmail('test');
      final result = controller.email;
      expect(result, 'test');
    });
  });

  group('InputUserController - validateFullName', () {
    test('Should retunr String ', () async {
      final result = controller.validateFullName('Arthur Barbosa');
      expect(result, null);
    });

    test('Should return ', () async {
      final result = controller.validateFullName('123 Barbosa');
      expect(result, isA<String>());
    });
  });

  group('InputUserController - validateEmail', () {
    test('Should retunr String ', () async {
      final result = controller.validateEmail('arthur.bos@hotmail.com');
      expect(result, null);
    });

    test('Should return ', () async {
      final result = controller.validateEmail('123 Barbosa');
      expect(result, isA<String>());
    });
  });
}
