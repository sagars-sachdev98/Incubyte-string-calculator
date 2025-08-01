import 'package:incubyte_string_calculator/core/errors.dart';
import 'package:incubyte_string_calculator/data/string_calculator_impl.dart';
import 'package:incubyte_string_calculator/domain/usecases/add_numbers_usecase.dart';

void main() {
  late AddNumbersUseCase addNumbers;
  addNumbers = AddNumbersUseCase(StringCalculatorImpl());
  // empty string -> 0
  assert(addNumbers.call('') == 0);

  // single and two comma-separated numbers
  assert(addNumbers.call('1') == 1);
  assert(addNumbers.call('1,5') == 6);

  // any amount of comma-separated numbers
  assert(addNumbers.call('1,2,3') == 6);
  assert(addNumbers.call('10,20,30,40,50') == 150);
  assert(addNumbers.call(' 3 , 4 ,5 , 6 ') == 18);

  // allow new lines between numbers (as delimiter)
  assert(addNumbers.call('1\n2,3') == 6);

  // custom delimiter header
  assert(addNumbers.call('//;\n1;2') == 3);
  assert(addNumbers.call('//|\n1|2|3') == 6);
  assert(addNumbers.call('//#\n4#5#6') == 15);

  // throw exception with all negative
  try {
    addNumbers.call('-1,-2,3,-4');
    assert(false);
  } on NegativeNumbersException catch (e) {
    assert(e.toString().contains('negative numbers not allowed -1,-2,-4'));
  }

  print('All asserts passed ✔');
}
