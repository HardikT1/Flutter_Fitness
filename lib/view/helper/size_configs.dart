extension Capitalized on String {
  String capitalized() =>
      substring(0, 1).toUpperCase() + substring(1).toLowerCase();
}

extension NumberParsing on String {
  String toDouble() {
    return double.parse(this).toStringAsFixed(2);
  }
}
