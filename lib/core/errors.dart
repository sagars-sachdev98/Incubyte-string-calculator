class NegativeNumbersException implements Exception {
  final List<int> numbers;
  NegativeNumbersException(this.numbers);

  @override
  String toString() => 'negative numbers not allowed ${numbers.join(',')}';
}
