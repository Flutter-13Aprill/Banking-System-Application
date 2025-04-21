class Account{
  static int idGenerator=1;
  final int _accountId;
  double _balance;
  List<String> transactions;
  bool isClosed;
  int getAccountId() =>_accountId;
  Account(this._balance,this.isClosed):_accountId=generateId(),transactions=[];
// **Deposit Money**
  depost(int value){
    // increase balance
    _balance+=value;
    //add this to Transaction
    transactions.add("deposit : $value \$ 💵 ");
    print("depost $value successfully");
  }
// **Withdraw Money**
  withdraw(int value){
    if(value>_balance) print("you don't have enough balance ");
    else{
    // decrease balance 
    _balance-=value;
     //add this to Transaction
    transactions.add("withdraw : $value \$ 💸 ");
     print("withdraw $value successfully"); 
    }
  }
// **View Transaction History**
  showTransactions(){
    print("account number: $_accountId \n");
    transactions.forEach((item){
      print("-  $item");
    });
    print("balance: $_balance \n");
  }
  // close account 
  closeAccount(){
    isClosed=true;
    print("your account is closed");
  }

 static int  generateId()  =>  idGenerator++;

  
}