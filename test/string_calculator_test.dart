import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte_string_calculator/core/errors.dart';
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

    test('returns the number for single number input', () {
      expect(addNumbers.call('1'), 1);
    });

    test('sums two comma-separated numbers', () {
      expect(addNumbers.call('1,5'), 6);
    });

    test('handles any amount of comma-separated numbers', () {
      expect(addNumbers.call('1,2,3'), 6);
      expect(addNumbers.call('10,20,30,40,50'), 150);
      expect(addNumbers.call(' 3 , 4 ,5 , 6 '), 18);
    });

    test('handles newline between numbers', () {
      expect(addNumbers.call('1\n2,3'), 6);
    });

    test('supports custom delimiter header', () {
      expect(addNumbers.call('//;\n1;2'), 3);
      expect(addNumbers.call('//|\n1|2|3'), 6);
      expect(addNumbers.call('//#\n4#5#6'), 15);
    });

    test('lists all negatives in the exception, comma separated', () {
      expect(
        () => addNumbers.call('-1,-2,3,-4'),
        throwsA(predicate((e) =>
            e is NegativeNumbersException &&
            e.toString() == 'negative numbers not allowed -1,-2,-4')),
      );
    });
  });
}
