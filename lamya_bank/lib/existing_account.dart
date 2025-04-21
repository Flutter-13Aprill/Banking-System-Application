class ExistingAccount {
  String? name;
  int? bankId;
  int balance = 0;
  Map<int, DateTime> depositTransactions = {};
  Map<int, DateTime> withdrawtransactions = {};

  //Constructor
  ExistingAccount(this.name, this.bankId, this.balance);
}
