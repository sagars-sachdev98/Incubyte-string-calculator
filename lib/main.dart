import 'package:incubyte_string_calculator/data/string_calculator_impl.dart';
import 'package:incubyte_string_calculator/domain/usecases/add_numbers_usecase.dart';

void main() {
  late AddNumbersUseCase addNumbers;
  addNumbers = AddNumbersUseCase(StringCalculatorImpl());
  // Step 1: adding ints
  assert(addNumbers.call('') == 0);

  assert(addNumbers.call('1') == 1);
  assert(addNumbers.call('1,5') == 6);

  assert(addNumbers.call('1,2,3') == 6);
  assert(addNumbers.call('10,20,30,40,50') == 150);
  assert(addNumbers.call(' 3 , 4 ,5 , 6 ') == 18);

  assert(addNumbers.call('1\n2,3') == 6);
  print('All asserts passed ✔');
}
