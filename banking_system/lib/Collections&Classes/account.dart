
// This the "Account" class where we will create an object from for each user account.
class Account {
  final String accountOwnerName;
  final int accountNumber;
  double _moneyAmount;
  Map <DateTime, String> transactionHistory ;

  Account(this.accountOwnerName,this.accountNumber, this._moneyAmount, this.transactionHistory);

  // This the setter for the private attribute "_moneyAmount".
  void setMoney (double newMoneyAmount) {
    this._moneyAmount = newMoneyAmount;
  }
   // This the getter for the private attribute "_moneyAmount".
  double getMoney(){
    return _moneyAmount;
  }

}