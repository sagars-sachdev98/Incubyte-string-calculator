import 'package:incubyte_string_calculator/data/string_calculator_impl.dart';
import 'package:incubyte_string_calculator/domain/usecases/add_numbers_usecase.dart';

void main() {
  late AddNumbersUseCase addNumbers;
  addNumbers = AddNumbersUseCase(StringCalculatorImpl());
  // Step 1: empty string
  assert(addNumbers.call('') == 0);
  print('All asserts passed ✔');
}
