class FormatDoubleDecimalWithCents {
  static String call(double amount, String decimal, String cents) {
    var value = amount.toStringAsFixed(0);
    final listCharacters = [];
    var decimalCount = 0;

    value = value.split('').reversed.join();

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

    var formatted = listCharacters.join();

    return formatted;
  }
}
