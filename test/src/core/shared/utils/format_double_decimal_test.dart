import 'package:flutter_test/flutter_test.dart';
import 'package:rispar_credit_simulator/src/core/shared/utils/format_double_decimal.dart';

void main() {
  group('FormatDoubleDecimal', () {
    test('Should return String', () async {
      final result = FormatDoubleDecimal.call(5000);

      expect(result, '5.000');
    });
  });
}
