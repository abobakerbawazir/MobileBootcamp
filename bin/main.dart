import 'Bankclass.dart';
import 'CurrentAccount.dart';
import 'SavingsAccount.dart';

void main(List<String> args) {
  SavingsAccount s = SavingsAccount(500, "1234567ytg45", 1.25);
  SavingsAccount s1 = SavingsAccount(4500, "1234534", 1.25);
  CurrentAccount c = CurrentAccount(4000, "12344fgg", 23);

  Bank b = Bank();
  b.addAccount(c);
  b.withdrawofAccount(c, 50000);
  c.withdraw(3);
  b.addAccount(s);
  b.addAccount(s1);
  b.printAccountBalances(s);
  s.interest();
  s1.interest();
  //a.interest();
}
