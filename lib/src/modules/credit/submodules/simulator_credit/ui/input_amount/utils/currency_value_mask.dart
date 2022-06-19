import 'package:flutter/services.dart';

class CurrencyValueMask extends TextInputFormatter {
  final String symbol;
  final String decimal;
  final String cents;

  CurrencyValueMask(
      {required this.symbol, required this.decimal, required this.cents});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var value = newValue.text.replaceAll(RegExp(r'\D'), '');

    value = (int.tryParse(value) ?? 0).toString();

    if (value.length < 3) {
      value = value.padLeft(3, '0');
    }

    value = value.split('').reversed.join();

    final listCharacters = [];
    var decimalCount = 0;

    for (var i = 0; i < value.length; i++) {
      if (i == 2) {
        listCharacters.insert(0, cents);
      }

      if (i > 2) {
        decimalCount++;
      }

      if (decimalCount == 3) {
        listCharacters.insert(0, decimal);
        decimalCount = 0;
      }

      listCharacters.insert(0, value[i]);
    }

    listCharacters.insert(0, symbol);
    var formatted = listCharacters.join();

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.fromPosition(
        TextPosition(offset: formatted.length),
      ),
    );
  }
}

// class CurrencyNewValueMask extends TextInputFormatter {
//   final int maxLength = 6;

//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final newValueLength = newValue.text.length;
//     var selectionIndex = newValue.selection.end;

//     if (newValueLength > maxLength) {
//       return oldValue;
//     }

//     var substrIndex = 0;
//     final newText = StringBuffer();
//     switch (newValueLength) {
//       case 4:
//         newText.write(
//             '${newValue.text.substring(0, substrIndex = 1)}.${newValue.text.substring(1, substrIndex = 3)}');
//         selectionIndex += 1;
//         break;
//       case 5:
//         newText.write(
//             '${newValue.text.substring(0, substrIndex = 2)}.${newValue.text.substring(2, substrIndex = 4)}');
//         selectionIndex += 1;
//         break;
//       case 6:
//         newText.write(
//             '${newValue.text.substring(0, substrIndex = 3)}.${newValue.text.substring(3, substrIndex = 5)}');
//         selectionIndex += 1;
//         break;
//       default:
//     }

//     if (newValueLength >= substrIndex) {
//       newText.write(newValue.text.substring(substrIndex));
//     }

//     return TextEditingValue(
//       text: newText.toString(),
//       selection: TextSelection.collapsed(offset: selectionIndex),
//     );
//   }
// }
