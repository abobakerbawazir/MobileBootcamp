//5) Write class called "BankAccount" with properties like "accountNumber" and "balance".
//Implement methods to deposit=يضيف and withdraw=سحب money from the account.
import 'dart:io';

class BankAccount {
  late int accountNumber;
  late double balance;

  BankAccount(int a, double b) {
    accountNumber = a;
    balance = b;
  }
  deposit() {
    stdout.write("this accountNumber $accountNumber contains plancse $balance");
    stdout.write("\n enter the deposit of accountNumber $accountNumber : ");
    double x = double.parse(stdin.readLineSync()!);
    balance = x + balance;
    print("accountNumber of $accountNumber  contains balance= $balance");
  }

  withdraw() {
    stdout.write("this accountNumber $accountNumber contains plancse $balance");
    stdout.write("\n enter the withdraw of accountNumber $accountNumber :");
    double x = double.parse(stdin.readLineSync()!);

    if (x > balance) {
      print(
          "can not withdraw $x from accountNumber $accountNumber ,becuse accountNumber contains $balance ");
      print("balance $balance < withdraw $x");
    } else {
      balance = balance - x;
      print("accountNumber of $accountNumber  contains balance= $balance");
      
    }
  }
}

void main(List<String> args) {
  BankAccount b = BankAccount(1212344, 100);
  String coise = "";
  while (coise!="q") {
    stdout.write(
        "enter the chois 1 for deposit and 2 withdraw and q to finish : ");
     coise = stdin.readLineSync()!;
    switch (coise) {
      case "1":
        b.deposit();
        break;
      case "2":
        b.withdraw();
        break;
      case "q":
        print("finish the programming");
        break;

      default:
        print('enter raigh agin input is unvalid');
    }
  }
}
