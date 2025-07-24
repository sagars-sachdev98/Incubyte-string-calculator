import 'package:incubyte_string_calculator/core/errors.dart';
import 'package:incubyte_string_calculator/domain/string_calculator.dart';

class StringCalculatorImpl implements StringCalculator {
  @override
  int add(String numbers) {
    // empty string ⇒ 0
    if (numbers.isEmpty) return 0;

    var separator = ',';

    if (numbers.startsWith('//')) {
      final nlIndex = numbers.indexOf('\n');
      separator = numbers.substring(2, nlIndex);
      numbers = numbers.substring(nlIndex + 1);
    }

    numbers = numbers.replaceAll('\n', separator);

    final parts = numbers.split(separator);

    final values = parts
        .map((p) => p.trim())
        .where((t) => t.isNotEmpty)
        .map(int.parse)
        .toList();

    final negatives = values.where((v) => v < 0).toList();
    if (negatives.isNotEmpty) {
      throw NegativeNumbersException(negatives);
    }

    return values.fold(0, (sum, v) => sum + v);
  }
}
