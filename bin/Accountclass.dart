abstract class Account {
  late double _balance;
  late String _id;
  Account(this._balance, this._id);

  double get Balance {
    return _balance;
  }

  void set Balance(double balance) {
    this._balance = balance;
  }

  ///
  String get Id {
    return _id;
  }

  void set Id(String id) {
    this._id = id;
  }

  void deposit(double amount) {
    this._balance += amount;
    print("Deposited $amount into account ${this._id}");
  }

  void withdraw(double amount) {
    if (this._balance >= amount) {
      this._balance -= amount;
      print("Withdrawn $amount from account ${this._id}");
    } else {
      print("Insufficient balance in account ${this._id}");
    }
  }
}
