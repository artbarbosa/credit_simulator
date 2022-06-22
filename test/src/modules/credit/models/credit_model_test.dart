import 'package:flutter_test/flutter_test.dart';
import 'package:rispar_credit_simulator/src/modules/credit/models/credit_model.dart';

import '../../../../mocks/mock.dart';

void main() {
  group('CreditModel - fromMap', () {
    test('Should return CreditModel', () async {
      final result = CreditModel.fromMap(creditMapMock);

      expect(result, isA<CreditModel>());
      expect(result.ltv, 35);
    });
  });

  group('CreditModel - convertBitcoinToSats', () {
    test('Should return double', () async {
      final result = creditModelMock.convertBitcoinToSats();
      expect(result, 0.0481304);
    });
  });
}
