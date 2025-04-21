class Bank {
  int? accountNumber;
  String? userName;
  double balance;
  Map<DateTime, String> transactioHistory = {};

  Bank(this.accountNumber, this.userName, this.balance, this.transactioHistory);
}
