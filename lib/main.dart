import 'package:incubyte_string_calculator/data/string_calculator_impl.dart';
import 'package:incubyte_string_calculator/domain/usecases/add_numbers_usecase.dart';

void main() {
  late AddNumbersUseCase addNumbers;
  addNumbers = AddNumbersUseCase(StringCalculatorImpl());
  // Step 1: adding ints
  assert(addNumbers.call('') == 0);

  assert(addNumbers.call('1') == 1);
  assert(addNumbers.call('1,5') == 6);
  assert(addNumbers.call('1 ,2,3, ,4') == 10);
  print('All asserts passed ✔');
}
