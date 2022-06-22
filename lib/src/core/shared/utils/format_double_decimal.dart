class FormatDoubleDecimal {
  static call(double amount) {
    var value = amount.toStringAsFixed(0);
    final listCharacters = [];
    var decimalCount = 0;

    value = value.split('').reversed.join();

    for (var i = 0; i < value.length; i++) {
      if (i > 0) {
        decimalCount++;
      }
      if (decimalCount == 3) {
        listCharacters.insert(0, '.');
        decimalCount = 0;
      }
      listCharacters.insert(0, value[i]);
    }

    var formatted = listCharacters.join();

    return formatted;
  }
}
