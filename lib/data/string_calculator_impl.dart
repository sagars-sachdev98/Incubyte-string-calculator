import 'package:incubyte_string_calculator/core/errors.dart';
import 'package:incubyte_string_calculator/domain/string_calculator.dart';

class StringCalculatorImpl implements StringCalculator {
  @override
  int add(String numbers) {
    // Return 0 for empty input
    if (numbers.isEmpty) return 0;

    // Use comma as the default separator
    var separator = ',';

    // Check for custom delimiter at the start
    if (numbers.startsWith('//')) {
      final nlIndex = numbers.indexOf('\n');
      separator = numbers.substring(2, nlIndex);
      numbers = numbers.substring(nlIndex + 1);
    }

    // Treat newline as the current separator as well
    numbers = numbers.replaceAll('\n', separator);

    // Split the string into parts
    final parts = numbers.split(separator);

    // Parse, ignoring empty tokens (e.g., double commas)
    final values = parts
        .map((p) => p.trim())
        .where((t) => t.isNotEmpty)
        .map(int.parse)
        .toList();

    // Check for negatives, throw if found
    final negatives = values.where((v) => v < 0).toList();
    if (negatives.isNotEmpty) {
      throw NegativeNumbersException(negatives);
    }

    // Return the sum of all values
    return values.fold(0, (sum, v) => sum + v);
  }
}
