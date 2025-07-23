import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte_string_calculator/data/string_calculator_impl.dart';
import 'package:incubyte_string_calculator/domain/usecases/add_numbers_usecase.dart';

void main() {
  late AddNumbersUseCase addNumbers;

  setUp(() {
    addNumbers = AddNumbersUseCase(StringCalculatorImpl());
  });

  group('AddNumbersUseCase (StringCalculator.add)', () {
    test('returns 0 for empty string', () {
      expect(addNumbers.call(''), 0);
    });
  });
}
