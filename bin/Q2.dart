import 'dart:io';

void main() {
  print('Enter a list of numbers ');
  String input = stdin.readLineSync()!;
  List<String> inputNumbers = input.split(' ');
  List<int> numbers = inputNumbers.map(int.parse).toList();
  findMinMax(numbers);
  while (numbers == input);

}

void findMinMax(List<int> numbers) {
  if (numbers.isEmpty) {
    print('the list is Empty.');
    return;
  }

  int min = numbers[0];
  int max = numbers[0];
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] < min) {
      min = numbers[i];
    }
    if (numbers[i] > max) {
      max = numbers[i];
    }
  }
  print('min number : $min');
  print('min number : $max');
}