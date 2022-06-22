import 'package:flutter_test/flutter_test.dart';
import 'package:rispar_credit_simulator/src/core/shared/utils/format_double_decimal_with_cents.dart';

void main() {
  group('FormatDoubleDecimalWithCents', () {
    test('Should return String', () async {
      final result = FormatDoubleDecimalWithCents.call(5000, '.', ',');

      expect(result, '50,00');
    });
  });
}
