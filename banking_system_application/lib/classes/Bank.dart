
import 'package:banking_system_application/classes/Account.dart';

class Bank{
 String _bankName;
 Set<Account> accounts;
 Bank(this._bankName):accounts={}; 
//  **Create an Account**
 createAcount(Account acount){
//   check if accoun is exist
  if(!accounts.contains(acount)) accounts.add(acount);
  else throw("this account is created befor ");
 }

 Account getAccount(int accountId) {
  //return account if is create and not close 
  return accounts.firstWhere(
    (account) => account.getAccountId() == accountId && account.isClosed==false,
    orElse: () => throw ("There is no account with ID $accountId"),
  );
}



 
}