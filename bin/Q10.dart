//10 - Write a program to count the number 4 in a given list
void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 4, 5, 7, 8, 4, 6, 8];
  int conuter = 0;
  for (int i =1; i < numbers.length; i++) {
    if (numbers[i] == 4) {
      conuter++;
    }
  }
  print("the number of count 4 = $conuter");
}
