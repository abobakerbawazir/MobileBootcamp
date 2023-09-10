import 'dart:io';

String reverseWords(String input) {
  List<String> words = input.split(' ');
  List<String> reversedWords = words.reversed.toList();
  return reversedWords.join(' ');
}

void main() {
  stdout.write('Enter multiple words: ');
  String userInput = stdin.readLineSync()!;
  
  String reversedString = reverseWords(userInput);
  print('Reversed words: $reversedString');
}