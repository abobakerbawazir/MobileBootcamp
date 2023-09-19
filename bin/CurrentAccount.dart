import 'AccountManagement.dart';
import 'Accountclass.dart';

class CurrentAccount extends Account implements AccountManagement{
  late double overdaraftlimit;
  CurrentAccount(super.balance, super.id, this.overdaraftlimit) {
    // if (overdaraftlimit >= -1000) {
    //   this.overdaraftlimit = overdaraftlimit;
    // } else {
    //   print(" overdaraftlimit <-1000");
    // }
  }
  
  @override
  void interest() {
    if (Balance >= -1000) {
      this.Balance = Balance;
    } else {
      print(" overdaraftlimit <-1000");
    }
    // TODO: implement interest
  }

  
}
