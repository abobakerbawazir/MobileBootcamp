import 'dart:io';

void main() {
  var input;
  do {
    print('choose operation\n1.+\n2.-');
    stdout.write('Enter choice : ');
    input = stdin.readLineSync();
    switch (input) {
      case '1':
        stdout.write('Enter no. 1 : ');
        var x = int.parse(stdin.readLineSync()!);
        stdout.write('Enter no. 2 : ');
        var y = int.parse(stdin.readLineSync()!);
        print('sum : ${x + y}');
        break;

      case '2':
        stdout.write('Enter no. 1 : ');
        var x = int.parse(stdin.readLineSync()!);
        stdout.write('Enter no. 2 : ');
        var y = int.parse(stdin.readLineSync()!);
        print('diff : ${x - y}');
        break;

      case 'q':
        print('GoodBye');
        break;

      default:
        print('enter right choise');
    }
  } while (input != 'q');
}
