import 'Accountclass.dart';

class Bank {
  List<Account> listofaccounts = [];
  //add , delete , deposite withdrow
  addAccount(Account account) {
    this.listofaccounts.add(account);
  }

  removeAccount(Account account) {
    this.listofaccounts.remove(account);
  }

  void depositofAccount(Account account, double amount) {
    if (amount > 0) {
      account.Balance += amount;
      print(
          "Add deposit of Account  ${account.Id} and Balance = ${account.Balance}");
    } else {
      print("not add balanse <= zere");
    }
  }

  ///
  void withdrawofAccount(Account account, double amount) {
    if (amount <= account.Balance + 1000) {
      account.Balance -= amount;
      print(
          "Add withdraw of Account  ${account.Id} and Balance = ${account.Balance}");
    } else
      print("no");
  }

  void printAccountBalances(Account account) {
    this.listofaccounts.forEach((element) {
      print(
          " Account id = ${element.runtimeType} and balance = ${element.Balance}");
    });
  }
}
