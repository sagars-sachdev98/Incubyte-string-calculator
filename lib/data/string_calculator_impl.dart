import 'package:incubyte_string_calculator/domain/string_calculator.dart';

class StringCalculatorImpl implements StringCalculator {
  @override
  int add(String numbers) {
    // empty string ⇒ 0
    if (numbers.isEmpty) return 0;

    var separator = ',';
    numbers = numbers.replaceAll('\n', separator);

    final parts = numbers.split(',');
    if (parts.length == 1) {
      return int.parse(parts.first.trim());
    }
    // two (or more) comma numbers
    return parts
        .map((p) => p.trim())
        .where((t) => t.isNotEmpty)
        .map(int.parse)
        .fold(0, (sum, e) => sum + e);
  }
}
