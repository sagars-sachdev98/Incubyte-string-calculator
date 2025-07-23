import 'package:incubyte_string_calculator/domain/string_calculator.dart';

class StringCalculatorImpl implements StringCalculator {
  @override
  int add(String numbers) {
    // empty string ⇒ 0
    if (numbers.isEmpty) return 0;

    throw UnimplementedError('Next step: handle numbers');
  }
}