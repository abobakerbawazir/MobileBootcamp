import 'AccountManagement.dart';
import 'Accountclass.dart';

class SavingsAccount extends Account implements AccountManagement {
  late double interestrate;
  SavingsAccount(super.balance, super.id, this.interestrate) {
    // this.Balance = this.Balance + (interestrate / (10000 / 125));
  }

  @override
  void interest() {
    
    this.Balance = this.Balance + (this.Balance * (interestrate / 100));
    print(this.Balance);
    // TODO: implement interest
  }
}
