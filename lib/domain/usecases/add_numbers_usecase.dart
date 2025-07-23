import 'package:incubyte_string_calculator/domain/string_calculator.dart';

class AddNumbersUseCase {
  final StringCalculator _calculator;
  AddNumbersUseCase(this._calculator);

  int call(String input) => _calculator.add(input);
}